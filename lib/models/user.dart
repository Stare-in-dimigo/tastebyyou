class User {
  String name = "";
  List<int> customRecipes = [];
  List<int> likedRecipes = [];

  User(this.name, List<int> this.customRecipes, List<int> this.likedRecipes);

  User.fromMap(Map map) {
    List<dynamic> raw_custom = map["customRecipes"] as List<dynamic>;
    List<int> custom = [];

    for (var item in raw_custom) {
      if (item is int) {
        custom.add(item);
      }
    }

    List<dynamic> raw_liked = map["likedRecipes"] as List<dynamic>;
    List<int> liked = [];

    for (var item in raw_liked) {
      if (item is int) {
        liked.add(item);
      }
    }

    this.name = map["name"];
    this.customRecipes = custom;
    this.likedRecipes = liked;
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "customRecipes": customRecipes,
      "likedRecipes": likedRecipes
    };
  }
}
