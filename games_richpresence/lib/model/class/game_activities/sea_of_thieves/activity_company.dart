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

  static SeaOfThievesActivityCompany fromJson(Map<String, dynamic> json) {
    return SeaOfThievesActivityCompany(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      backgroundImage: json['background_image'] as String,
      categories: SeaOfThievesActivityCategory.fromJsonList(json['categories']),
    );
  }

  static List<SeaOfThievesActivityCompany> fromJsonList(String json) {
    final List<dynamic> parsed = jsonDecode(json);
    return parsed.map((e) => SeaOfThievesActivityCompany.fromJson(e)).toList();
  }
}
