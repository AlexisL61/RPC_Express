import 'package:games_richpresence/model/class/game_activities/the_finals/gamemode.dart';
import 'package:games_richpresence/model/class/game_activities/the_finals/gamemode_category.dart';
import 'package:games_richpresence/model/mvvm/view_events/push_route_event.dart';
import 'package:games_richpresence/model/mvvm/view_model.dart';
import 'package:games_richpresence/pages/the_finals/gamemodes/gamemodes_page.dart';
import 'package:games_richpresence/services/activity_service.dart';
import 'package:games_richpresence/services/online_translation_service.dart';
import 'package:get_it/get_it.dart';

class TheFinalsGamemodesCategoriesPageViewModel extends EventViewModel {
  GetIt getIt = GetIt.instance;

  late ActivityService _activityService;
  late OnlineTranslationsService translationService;

  List<TheFinalsGamemodeCategory> gamemodeCategories = [];

  TheFinalsGamemodesCategoriesPageViewModel(
      {ActivityService? activityService, OnlineTranslationsService? translationService}) {
    _activityService = activityService ?? getIt.get<ActivityService>();
    this.translationService = translationService ?? getIt.get<OnlineTranslationsService>();
    gamemodeCategories = _activityService.activities.map((e) => e as TheFinalsGamemodeCategory).toList();
  }

  void onCategorySelected(TheFinalsGamemodeCategory category) async {
    TheFinalsGamemode? gamemode =
        await notify(PushRouteEvent(TheFinalsGamemodesPageRoute.route, arguments: category)) as TheFinalsGamemode?;
    if (gamemode != null) {
      notify(PushRouteEvent(TheFinalsGamemodesPageRoute.route, arguments: gamemode));
    }
  }
}
