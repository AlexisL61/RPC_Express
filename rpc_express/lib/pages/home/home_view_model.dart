import 'package:rpc_express/model/class/games/game_object.dart';
import 'package:rpc_express/model/class/user_data/user_data.dart';
import 'package:rpc_express/model/mvvm/view_model.dart';
import 'package:rpc_express/services/common/discord_service.dart';
import 'package:rpc_express/services/common/game_change_service.dart';
import 'package:rpc_express/services/common/online_translation_service.dart';
import 'package:get_it/get_it.dart';

class HomeViewModel extends EventViewModel {
  GameObject selectedGame = GameObject.seaOfThieves;

  final GetIt getIt = GetIt.instance;

  late OnlineTranslationsService translationService;
  late GameChangeService gameChangeService;
  late DiscordService discordService;

  String language;
  Function(String) setFontFamily;
  bool isLoadingGame = false;

  HomeViewModel(
      {OnlineTranslationsService? translationService,
      GameChangeService? gameChangeService,
      DiscordService? discordService,
      required this.language,
      required this.setFontFamily}) {
    this.translationService = translationService ?? getIt.get<OnlineTranslationsService>();
    this.gameChangeService = gameChangeService ?? getIt.get<GameChangeService>();
    this.discordService = discordService ?? getIt.get<DiscordService>();
    changeGame(GameObject.seaOfThieves);
  }

  Future<void> changeGame(GameObject gameObject) async {
    selectedGame = gameObject;
    isLoadingGame = true;
    notify();
    await gameChangeService.changeGame(gameObject, language);
    setFontFamily(gameObject.fontFamily);
    isLoadingGame = false;
    notify();
  }

  Future<void> updateRpc(UserData userData) async {
    discordService.updateRpc(userData);
  }
}
