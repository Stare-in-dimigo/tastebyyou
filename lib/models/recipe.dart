import 'activity.dart';

class Recipe {
  int id = 1000;
  String name = "";
  String description = "";
  String author = "";
  List<Activity> procedure = [];
  int likeCount = 0;

  Recipe(this.id, this.name, this.description, this.author, this.procedure,
      this.likeCount);

  Recipe.fromMap(Map map) {
    id = map["id"];
    name = map["name"];
    description = map["description"];
    author = map["author"];

    List<dynamic> raw = map["procedure"] as List<dynamic>;
    List<Activity> result = [];

    for (var item in raw) {
      try {
        result.add(Activity.fromMap(item));
      } catch (exc) {}
    }

    procedure = result;

    likeCount = map["likeCount"];
  }

  Map<String, dynamic> toMap() {
    List<Map> procedureMap = [];
    for (var activity in procedure) {
      procedureMap.add(activity.toMap());
    }

    return {
      "id": id,
      "name": name,
      "description": description,
      "author": author,
      "procedure": procedureMap,
      "likeCount": likeCount
    };
  }
}
