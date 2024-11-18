import 'package:rpc_express/model/class/game_activities/sea_of_thieves/activity.dart';

class SeaOfThievesActivityTransformer {
  late SeaOfThievesActivityTransformer activityTransformer;

  SeaOfThievesActivityTransformer();

  SeaOfThievesActivity fromJson(Map<String, dynamic> json) {
    return SeaOfThievesActivity(
        id: json['id'] as String,
        name: json['name'] as String,
        length: json['length'] as int,
        description: json['description'] as String,
        image: json['image'] as String,
        rpc: json['rpc'] as String);
  }

  List<SeaOfThievesActivity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }
}
