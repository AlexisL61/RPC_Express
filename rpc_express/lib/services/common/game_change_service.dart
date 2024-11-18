import 'package:rpc_express/model/class/games/game_object.dart';
import 'package:rpc_express/services/common/activity_service.dart';
import 'package:rpc_express/services/common/api_service.dart';
import 'package:rpc_express/services/common/discord_service.dart';
import 'package:rpc_express/services/common/online_translation_service.dart';
import 'package:get_it/get_it.dart';

abstract class GameChangeService {
  Future<void> changeGame(GameObject gameObject, String language);
}

class GameChangeServiceImpl implements GameChangeService {
  final GetIt getIt = GetIt.instance;

  late final ApiService apiService;
  late final OnlineTranslationsService translationService;
  late final ActivityService activityService;
  late final DiscordService discordService;

  GameChangeServiceImpl(
      {ApiService? apiService,
      OnlineTranslationsService? translationService,
      ActivityService? activityService,
      DiscordService? discordService}) {
    this.apiService = apiService ?? getIt.get<ApiService>();
    this.translationService = translationService ?? getIt.get<OnlineTranslationsService>();
    this.activityService = activityService ?? getIt.get<ActivityService>();
    this.discordService = discordService ?? getIt.get<DiscordService>();
  }

  @override
  Future<void> changeGame(GameObject gameObject, String language) async {
    apiService.changeGame(gameObject);
    await translationService.fetchAvailableTranslations();
    await translationService.fetchSpecificTranslation(language);
    await activityService.fetchActivities();
    discordService.initialize(gameObject.rpcClientId);
  }
}
