import 'package:rpc_express/model/class/game_activities/helldivers/difficulties.dart';
import 'package:rpc_express/model/mvvm/view_events/pop_route_event.dart';
import 'package:rpc_express/model/mvvm/view_model.dart';

class DifficultyActivitySelectPageViewModel extends EventViewModel {
  onDifficultyClick(Difficulties difficulty) {
    notify(PopRouteEvent(arguments: difficulty));
  }
}
