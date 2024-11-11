import 'package:games_richpresence/model/class/user_group/the_finals/group.dart';
import 'package:games_richpresence/model/mvvm/view_events/pop_route_event.dart';
import 'package:games_richpresence/model/mvvm/view_model.dart';

class TheFinalsGroupPageViewModel extends EventViewModel {
  void onPlayerNumberSelected(TheFinalsGroup group) {
    notify(PopRouteEvent(arguments: group));
  }
}