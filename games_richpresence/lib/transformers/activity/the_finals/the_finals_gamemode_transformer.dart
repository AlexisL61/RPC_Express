import 'package:games_richpresence/model/class/game_activities/the_finals/gamemode.dart';

class TheFinalsGamemodeTransformer {
  TheFinalsGamemode fromJson(Map<String, dynamic> json) {
    return TheFinalsGamemode(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      rpc: json['rpc'] as String,
    );
  }

  List<TheFinalsGamemode> fromJsonList(List<dynamic> json) {
    final List<dynamic> parsed = json;
    return parsed.map((e) => fromJson(e)).toList();
  }
}
