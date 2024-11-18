import 'package:rpc_express/model/class/game_activities/sea_of_thieves/activity.dart';

class SeaOfThievesActivityCategory {
  final String name;
  final String id;
  final String icon;
  final List<SeaOfThievesActivity> activities;

  SeaOfThievesActivityCategory({required this.name, required this.id, required this.activities, required this.icon});
}