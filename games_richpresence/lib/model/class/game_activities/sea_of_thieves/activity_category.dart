import 'package:games_richpresence/model/class/game_activities/sea_of_thieves/activity.dart';

class SeaOfThievesActivityCategory {
  final String name;
  final String id;
  final String icon;
  final List<SeaOfThievesActivity> activities;

  SeaOfThievesActivityCategory({required this.name, required this.id, required this.activities, required this.icon});

  factory SeaOfThievesActivityCategory.fromJson(Map<String, dynamic> json) {
    return SeaOfThievesActivityCategory(
      name: json['name'],
      id: json['id'],
      activities: SeaOfThievesActivity.fromJsonList(json['activities']),
      icon: json['icon']
    );
  }

  static List<SeaOfThievesActivityCategory> fromJsonList(List<dynamic> json) {
    return json.map((e) => SeaOfThievesActivityCategory.fromJson(e)).toList();
  }
}