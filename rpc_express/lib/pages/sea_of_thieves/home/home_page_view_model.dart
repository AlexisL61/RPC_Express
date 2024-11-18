import 'package:rpc_express/model/class/game_activities/sea_of_thieves/activity.dart';
import 'package:rpc_express/model/class/user_data/sea_of_thieves_user_data.dart';
import 'package:rpc_express/model/class/user_data/user_data.dart';
import 'package:rpc_express/model/class/user_group/sea_of_thieves/driven_ship.dart';
import 'package:rpc_express/model/mvvm/view_events/push_route_event.dart';
import 'package:rpc_express/model/mvvm/view_model.dart';
import 'package:rpc_express/pages/sea_of_thieves/activities/choose_activity_company.dart';
import 'package:rpc_express/pages/sea_of_thieves/ships/choose_ship.dart';
import 'package:rpc_express/services/common/online_translation_service.dart';
import 'package:get_it/get_it.dart';

class SeaOfThievesHomePageViewModel extends EventViewModel {
  late SeaOfThievesUserData userData;

  final GetIt getIt = GetIt.instance;
  late OnlineTranslationsService translationService;
  Function(UserData) updateRpc;

  SeaOfThievesHomePageViewModel({OnlineTranslationsService? translationService, required this.updateRpc}) {
    this.translationService = translationService ?? getIt.get<OnlineTranslationsService>();
    userData = SeaOfThievesUserData(
        drivenShip: null, activity: null, onlineTranslate: this.translationService.onlineTranslate);
  }

  void onShipClick() async {
    userData.drivenShip = await notify(PushRouteEvent(ChooseShip.route)) as SeaOfThievesDrivenShip?;
    notify();
    updateRpc(userData);
  }

  void onActivityClick() async {
    userData.activity = await notify(const PushRouteEvent(ChooseActivityCompanyPage.route)) as SeaOfThievesActivity?;
    notify();
    updateRpc(userData);
  }
}
