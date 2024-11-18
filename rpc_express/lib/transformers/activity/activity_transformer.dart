import 'package:rpc_express/model/class/game_activities/game_activity.dart';

abstract class ActivityTransformer<T extends GameActivity> {
  T fromJson(Map<String, dynamic> json);

  List<T> fromJsonList(String json);
}
