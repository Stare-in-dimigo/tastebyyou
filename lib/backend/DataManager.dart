import 'dart:math';

import 'package:firebase_database/firebase_database.dart';

import '../models/recipe.dart';
import '../models/user.dart';
import 'data_util.dart';

class DataManager {
  User user = User("", [], []);

  DataManager._privateConstructor();

  static final DataManager _instance = DataManager._privateConstructor();

  factory DataManager() {
    return _instance;
  }

  Future<void> initialize(String userName) async {
    user = await getUser(userName);
  }

  Future<void> refreshUser() async {
    user = await getUser(user.name);
  }

  Future<void> uploadUser(User user) async {
    String userName = user.name;
    var ref = await getReference("user/$userName");

    await ref.set(user.toMap());
  }

  Future<void> uploadRecipe(Recipe recipe) async {
    int recipeId = recipe.id;
    var ref = await getReference("customRecipes/$recipeId");

    user.customRecipes.add(recipe.id);

    await updateMaxRecipeNumber(recipe.id);

    await ref.set(recipe.toMap());
  }

  Future<void> updateRecipeLikes(int recipeId, int change) async {
    Recipe recipe = await getCustomRecipe(recipeId);
    var ref = await getReference("customRecipes/$recipeId/");

    ref.update({"likeCount": recipe.likeCount + change});
  }

  Future<void> likeRecipe(int recipeId) async {
    user.likedRecipes.add(recipeId);
    updateRecipeLikes(recipeId, 1);
  }

  Future<void> dislikeRecipe(int recipeId) async {
    user.likedRecipes.remove(recipeId);
    updateRecipeLikes(recipeId, -1);
  }

  Future<void> updateMaxRecipeNumber(int number) async {
    var ref = await getReference("customRecipes");

    int maxNumber = await getMaxRecipeNumber();
    if (maxNumber < number) {
      maxNumber = number;
    }

    ref.update({"maxNumber": maxNumber});
  }

  Future<int> getMaxRecipeNumber() async {
    var snapshot = await getSnapshot("customRecipes/maxNumber");
    int result = snapshot.value as int;

    return result;
  }

  Future<int> getNextRecipeNumber() async {
    int maxNumber = await getMaxRecipeNumber();

    return maxNumber + 1;
  }

  bool isLikeRecipe(int recipeId) {
    final likedRecipes = user.likedRecipes;

    return likedRecipes.contains(recipeId);
  }

  Future<User> getUser(String userName) async {
    var snapshot = await getSnapshot("user/$userName");
    print(snapshot.value.runtimeType);

    Map<String, dynamic> raw = Map<String, dynamic>.from(snapshot.value as Map);

    return User.fromMap(raw);
  }

  Future<Map<String, double>> getCalories() async {
    DataSnapshot snapshot = await getSnapshot("ingredient");

    Map<String, dynamic> raw = Map<String, dynamic>.from(snapshot.value as Map);

    Map<String, double> result = {};

    raw.forEach((key, value) {
      if (value is double) {
        result[key] = value;
      } else if (value is int) {
        result[key] = value.toDouble();
      }
    });

    return result;
  }

  Future<double?> getCalorie(String ingredientName) async {
    return (await getCalories())[ingredientName];
  }

  Future<Map<String, List<String>>> getBaseRecipes() async {
    DataSnapshot snapshot = await getSnapshot("recipe");

    Map<String, dynamic> raw = Map<String, dynamic>.from(snapshot.value as Map);

    Map<String, List<String>> result = {};

    raw.forEach((key, value) {
      if (value is List<String>) {
        result[key] = value;
      } else if (value is List) {
        List<String> newValue = [];
        for (var item in value) {
          if (item is String) {
            newValue.add(item);
          }
        }
        result[key] = newValue;
      }
    });

    return result;
  }

  Future<List<String>?> getBaseRecipe(String recipeName) async {
    var raw = await getSnapshot("recipe/$recipeName"); // 됨
    List<dynamic> lst = raw.value as List<dynamic>;
    List<String> result = [];

    for (var item in lst) {
      if (item is String) {
        result.add(item);
      }
    }

    return result;
  }

  Future<Recipe> getCustomRecipe(int recipeId) async {
    var snapshot = await getSnapshot("customRecipes/$recipeId");
    Map<String, dynamic> raw = Map<String, dynamic>.from(snapshot.value as Map);

    return Recipe.fromMap(raw);
  }

  Future<List<Recipe>> loadTopRecipe(int count) async {
    int index = 1000;
    List<Recipe> recipeList = [];
    try {
      while (true) {
        recipeList.add(await getCustomRecipe(index));
        index += 1;
      }
    } catch (exc) {}

    count = min(recipeList.length, count);

    recipeList.sort((b, a) => a.likeCount.compareTo(b.likeCount));
    return recipeList.sublist(0, count);
  }

  Future<List<Recipe>> loadLikeRecipes() async {
    String userId = user.name;
    var snapshot = await getSnapshot("user/$userId/likedRecipes");
    List<dynamic> lst = snapshot.value as List<dynamic>;
    List<int> result = [];

    for (var item in lst) {
      if (item is int) {
        result.add(item);
      }
    }

    List<Recipe> recipes = [];
    for (var id in result) {
      recipes.add(await getCustomRecipe(id));
    }

    return recipes;
  }

  Future<double> calculateCalories(Map<String, int> ingredients) async {
    double result = 0;
    Map calories = await getCalories();

    ingredients.forEach((key, value) {
      result += calories[key] * value;
    });

    return result;
  }
}
