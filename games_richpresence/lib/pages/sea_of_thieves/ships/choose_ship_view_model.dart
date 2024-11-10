import 'package:games_richpresence/model/class/user_group/sea_of_thieves/driven_ship.dart';
import 'package:games_richpresence/model/class/user_group/sea_of_thieves/ship.dart';
import 'package:games_richpresence/model/mvvm/view_events/pop_route_event.dart';
import 'package:games_richpresence/model/mvvm/view_events/push_route_event.dart';
import 'package:games_richpresence/model/mvvm/view_model.dart';
import 'package:games_richpresence/pages/sea_of_thieves/ships/choose_ship_players.dart';

class ChooseShipViewModel extends EventViewModel {
  

  void onShipSelected(SeaOfThievesShip ship) async {
    int? playersSelected = await notify(PushRouteEvent(ChooseShipPlayerRoute.route, arguments: ship)) as int?;
    print(playersSelected);
    if (playersSelected == null) return;
    SeaOfThievesDrivenShip drivenShip = ship.toDrivenShip(playersSelected);
    notify(PopRouteEvent(arguments: drivenShip));
  }
}
