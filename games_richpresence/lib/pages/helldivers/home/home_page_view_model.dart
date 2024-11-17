import 'package:games_richpresence/model/class/game_activities/helldivers/activity.dart';
import 'package:games_richpresence/model/class/user_data/helldivers_user_data.dart';
import 'package:games_richpresence/model/class/user_data/user_data.dart';
import 'package:games_richpresence/model/mvvm/view_events/push_route_event.dart';
import 'package:games_richpresence/model/mvvm/view_model.dart';
import 'package:games_richpresence/pages/helldivers/activity_select/planet_select_page.dart';
import 'package:games_richpresence/services/common/online_translation_service.dart';
import 'package:get_it/get_it.dart';

import '../../../model/class/user_group/helldivers/group.dart';

class HelldiversHomePageViewModel extends EventViewModel {
  late HelldiversUserData userData;

  final GetIt getIt = GetIt.instance;
  late OnlineTranslationsService translationService;
  Function(UserData) updateRpc;

  HelldiversHomePageViewModel({OnlineTranslationsService? translationService, required this.updateRpc}) {
    this.translationService = translationService ?? getIt.get<OnlineTranslationsService>();
    userData = HelldiversUserData(group: null, onlineTranslate: this.translationService.onlineTranslate);
  }

  void onGroupClicked(int helldiversCount) async {
    userData.group = HelldiversGroup(groupSize: helldiversCount);
    notify();
    updateRpc(userData);
  }

  void onActivityClick() async {
    userData.activity = await notify(const PushRouteEvent(HelldiversPlanetSelectPage.route)) as HelldiversActivity?;
    notify();
    updateRpc(userData);
  }
}
