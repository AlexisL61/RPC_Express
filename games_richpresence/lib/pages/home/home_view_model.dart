import 'package:games_richpresence/model/class/games/game_object.dart';
import 'package:games_richpresence/model/mvvm/view_model.dart';
import 'package:games_richpresence/services/game_change_service.dart';
import 'package:games_richpresence/services/online_translation_service.dart';
import 'package:get_it/get_it.dart';

class HomeViewModel extends EventViewModel {
  GameObject selectedGame = GameObject.seaOfThieves;

  final GetIt getIt = GetIt.instance;

  late OnlineTranslationsService translationService;
  late GameChangeService gameChangeService;

  String language;
  bool isLoadingGame = false;

  HomeViewModel(
      {OnlineTranslationsService? translationService, GameChangeService? gameChangeService, required this.language}) {
    this.translationService = translationService ?? getIt.get<OnlineTranslationsService>();
    this.gameChangeService = gameChangeService ?? getIt.get<GameChangeService>();
    changeGame(GameObject.seaOfThieves);
  }

  Future<void> changeGame(GameObject gameObject) async {
    selectedGame = gameObject;
    isLoadingGame = true;
    notify();
    await gameChangeService.changeGame(gameObject, language);
    isLoadingGame = false;
    notify();
  }
}
