import 'package:enum_to_string/enum_to_string.dart';

enum ActivityType {
  boiling,
  blanching,
  steaming,
  boilingDown,
  roasting,
  frying,
  stirFrying,
  julienning,
  rondelling,
  mincing
}

enum Ingredient {
  onion,
  carrot,
  cucumber,
  garlic,
  mushroom,
  chicken,
  porkBelly,
  tenderloin,
  rib,
  sirloin,
  cream,
  milk,
  butter,
  cheese,
  seaweed,
  gim,
  kelp,
  anchovy,
  shrimp
}

enum Condiment { none, soySauce, sugar, salt, flour, oliveOil, pepper }

int stringToInt(String text) {
  RegExp regExp = RegExp(r'\d+');
  Iterable<Match> matches = regExp.allMatches(text);

  List<int> numbers =
      matches.map((match) => int.parse(match.group(0)!)).toList();

  return numbers[0];
}

int calculateSeconds(String inputTime) {
  int time = stringToInt(inputTime);
  if (inputTime.contains("h")) {
    return time * 3600;
  } else if (inputTime.contains("m")) {
    return time * 60;
  } else {
    return time;
  }
}

String enumToString(dynamic _enum) {
  return _enum.toString().split('.').last;
}

class Activity {
  Ingredient? ingredient;
  double? ingredientAmount;
  ActivityType? activityType;
  int? time;
  int? option;
  Condiment? condiment;

  Activity(this.ingredient, this.ingredientAmount, this.activityType,
      String time, this.option, this.condiment) {
    this.time = calculateSeconds(time);
  }

  Activity.fromMap(Map map) {
    ingredient = EnumToString.fromString(Ingredient.values, map["ingredient"]);
    ingredientAmount = double.parse(map["ingredientAmount"].toString());
    activityType =
        EnumToString.fromString(ActivityType.values, map["activityType"]);
    time = int.parse(map["time"].toString());
    if (map["option"] != null) option = int.parse(map["option"].toString());
    if (map["condiment"] != null)
      condiment = EnumToString.fromString(Condiment.values, map["condiment"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "ingredient": enumToString(ingredient),
      "ingredientAmount": ingredientAmount,
      "activityType": enumToString(activityType),
      "time": time,
      "option": option,
      "condiment": enumToString(condiment)
    };
  }
}
