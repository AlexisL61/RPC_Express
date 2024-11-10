import 'dart:convert';

import 'package:games_richpresence/model/class/game_activities/game_activity.dart';
import 'package:games_richpresence/model/class/game_activities/sea_of_thieves/activity_category.dart';

class SeaOfThievesActivityCompany with GameActivity{
  final String id;
  final String name;
  final String image;
  final String backgroundImage;
  final List<SeaOfThievesActivityCategory> categories;

  const SeaOfThievesActivityCompany({
    required this.id,
    required this.name,
    required this.image,
    required this.backgroundImage,
    required this.categories
  });
}
