import 'package:games_richpresence/model/class/game_activities/the_finals/gamemode.dart';
import 'package:games_richpresence/model/mvvm/view_events/pop_route_event.dart';
import 'package:games_richpresence/model/mvvm/view_model.dart';
import 'package:games_richpresence/services/activity_service.dart';
import 'package:games_richpresence/services/online_translation_service.dart';
import 'package:get_it/get_it.dart';

class TheFinalsGamemodesPageViewModel extends EventViewModel {
  GetIt getIt = GetIt.instance;

  late OnlineTranslationsService translationService;

  List<TheFinalsGamemode> gamemodes = [];

  TheFinalsGamemodesPageViewModel(
      {ActivityService? activityService,
      OnlineTranslationsService? translationService,
      required this.gamemodes}) {
    this.translationService = translationService ?? getIt.get<OnlineTranslationsService>();
  }

  void onGamemodeSelected(TheFinalsGamemode gamemode) {
    notify(PopRouteEvent(arguments: gamemode));
  }
}
