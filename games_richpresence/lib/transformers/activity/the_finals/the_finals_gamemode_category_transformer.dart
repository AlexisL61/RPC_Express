import 'dart:convert';

import 'package:games_richpresence/model/class/game_activities/the_finals/gamemode_category.dart';
import 'package:games_richpresence/transformers/activity/activity_transformer.dart';
import 'package:games_richpresence/transformers/activity/the_finals/the_finals_gamemode_transformer.dart';
import 'package:get_it/get_it.dart';

class TheFinalsGamemodeCategoryTransformer extends ActivityTransformer<TheFinalsGamemodeCategory> {
  final GetIt _getIt = GetIt.instance;
  late TheFinalsGamemodeTransformer categoryTransformer;

  TheFinalsGamemodeCategoryTransformer({TheFinalsGamemodeTransformer? categoryTransformer}) {
    this.categoryTransformer = categoryTransformer ?? _getIt.get<TheFinalsGamemodeTransformer>();
  }

  TheFinalsGamemodeCategory fromJson(Map<String, dynamic> json) {
    print(json['gamemodes']);
    return TheFinalsGamemodeCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      gamemodes: categoryTransformer.fromJsonList(json['gamemodes']),
    );
  }

  List<TheFinalsGamemodeCategory> fromJsonList(String json) {
    final List<dynamic> parsed = jsonDecode(json);
    return parsed.map((e) => fromJson(e)).toList();
  }
}