import 'package:rpc_express/model/class/game_activities/the_finals/gamemode.dart';
import 'package:rpc_express/model/mvvm/view_events/pop_route_event.dart';
import 'package:rpc_express/model/mvvm/view_model.dart';
import 'package:rpc_express/services/common/activity_service.dart';
import 'package:rpc_express/services/common/online_translation_service.dart';
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
