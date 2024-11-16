import 'package:games_richpresence/model/class/game_activities/the_finals/gamemode.dart';
import 'package:games_richpresence/model/class/user_data/helldivers_user_data.dart';
import 'package:games_richpresence/model/class/user_data/the_finals_user_data.dart';
import 'package:games_richpresence/model/class/user_data/user_data.dart';
import 'package:games_richpresence/model/class/user_group/the_finals/group.dart';
import 'package:games_richpresence/model/mvvm/view_events/push_route_event.dart';
import 'package:games_richpresence/model/mvvm/view_model.dart';
import 'package:games_richpresence/pages/the_finals/gamemodes/gamemodes_categories_page.dart';
import 'package:games_richpresence/pages/the_finals/group/group_page.dart';
import 'package:games_richpresence/services/online_translation_service.dart';
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
    //userData.gamemode = await notify(const PushRouteEvent(TheFinalsGamemodesCategoriesPage.route)) as TheFinalsGamemode?;
    notify();
    updateRpc(userData);
  }
}
