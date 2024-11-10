import 'package:games_richpresence/model/class/game_activities/sea_of_thieves/activity_category.dart';
import 'package:games_richpresence/transformers/activity/sea_of_thieves/sea_of_thieves_activity_transformer.dart';
import 'package:get_it/get_it.dart';

class SeaOfThievesActivityCategoryTransformer {
  final GetIt _getIt = GetIt.instance;
  late SeaOfThievesActivityTransformer activityTransformer;

  SeaOfThievesActivityCategoryTransformer({SeaOfThievesActivityTransformer? activityTransformer}) {
    this.activityTransformer = activityTransformer ?? _getIt.get<SeaOfThievesActivityTransformer>();
  }

  SeaOfThievesActivityCategory fromJson(Map<String, dynamic> json) {
    return SeaOfThievesActivityCategory(
      name: json['name'],
      id: json['id'],
      activities: activityTransformer.fromJsonList(json['activities']),
      icon: json['icon']
    );
  }

  List<SeaOfThievesActivityCategory> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }
}