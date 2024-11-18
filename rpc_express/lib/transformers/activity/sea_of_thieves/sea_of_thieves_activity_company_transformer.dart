import 'dart:convert';

import 'package:rpc_express/model/class/game_activities/sea_of_thieves/activity_company.dart';
import 'package:rpc_express/transformers/activity/activity_transformer.dart';
import 'package:rpc_express/transformers/activity/sea_of_thieves/sea_of_thieves_activity_category_transformer.dart';
import 'package:get_it/get_it.dart';

class SeaOfThievesActivityCompanyTransformer extends ActivityTransformer<SeaOfThievesActivityCompany> {
  final GetIt _getIt = GetIt.instance;
  late SeaOfThievesActivityCategoryTransformer categoryTransformer;

  SeaOfThievesActivityCompanyTransformer({SeaOfThievesActivityCategoryTransformer? categoryTransformer}) {
    this.categoryTransformer = categoryTransformer ?? _getIt.get<SeaOfThievesActivityCategoryTransformer>();
  }

  SeaOfThievesActivityCompany fromJson(Map<String, dynamic> json) {
    return SeaOfThievesActivityCompany(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      backgroundImage: json['background_image'] as String,
      categories: categoryTransformer.fromJsonList(json['categories']),
    );
  }

  List<SeaOfThievesActivityCompany> fromJsonList(String json) {
    final List<dynamic> parsed = jsonDecode(json);
    return parsed.map((e) => fromJson(e)).toList();
  }
}