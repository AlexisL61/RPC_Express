import 'package:games_richpresence/model/class/games/game_object.dart';
import 'package:games_richpresence/repositories/api/api_repository.dart';
import 'package:games_richpresence/services/common/activity_service.dart';
import 'package:games_richpresence/services/common/api_service.dart';
import 'package:games_richpresence/services/common/discord_service.dart';
import 'package:games_richpresence/services/common/game_change_service.dart';
import 'package:games_richpresence/services/common/online_translation_service.dart';
import 'package:games_richpresence/services/helldivers/helldivers_api_service.dart';
import 'package:games_richpresence/transformers/activity/helldivers/helldivers_planet_transformer.dart';
import 'package:games_richpresence/transformers/activity/the_finals/the_finals_gamemode_category_transformer.dart';
import 'package:games_richpresence/transformers/activity/the_finals/the_finals_gamemode_transformer.dart';
import 'package:games_richpresence/transformers/available_translations_transformer.dart';
import 'package:get_it/get_it.dart';
import 'package:games_richpresence/transformers/activity/sea_of_thieves/sea_of_thieves_activity_category_transformer.dart';
import 'package:games_richpresence/transformers/activity/sea_of_thieves/sea_of_thieves_activity_transformer.dart';

/// Provider for the transformers, the repositories and the services.
///
/// This class is responsible for initializing the objects and register them into the GetIt instance.
///
/// Every subclasses register their own transformers, repositories and services.
class Provider {
  final getIt = GetIt.instance;

  Provider() {
    initTransformers();
    initRepositories();
    initServices();
  }

  initTransformers() {
    getIt.registerSingleton<AvailableTranslationsTransformer>(AvailableTranslationsTransformer());
    getIt.registerSingleton<SeaOfThievesActivityTransformer>(SeaOfThievesActivityTransformer());
    getIt.registerSingleton<SeaOfThievesActivityCategoryTransformer>(SeaOfThievesActivityCategoryTransformer());
    getIt.registerSingleton<TheFinalsGamemodeTransformer>(TheFinalsGamemodeTransformer());
    getIt.registerSingleton<TheFinalsGamemodeCategoryTransformer>(TheFinalsGamemodeCategoryTransformer());
    getIt.registerSingleton<HelldiversPlanetTransformer>(HelldiversPlanetTransformer(
        biomeImageUrl: 'https://alexisl61.github.io/Games_RichPresence/assets/helldivers/biomes'));
  }

  initRepositories() {
    getIt.registerSingleton<ApiRepository>(ApiRepositoryImpl());
  }

  initServices() {
    getIt.registerSingleton<ApiService>(ApiServiceImpl(
        baseUrl: 'https://alexisl61.github.io/Games_RichPresence/api/v1', gameObject: GameObject.seaOfThieves));
    getIt.registerSingleton<OnlineTranslationsService>(OnlineTranslationServiceImpl());
    getIt.registerSingleton<DiscordService>(DiscordServiceImpl());
    getIt.registerSingleton<ActivityService>(ActivityServiceImpl());
    getIt.registerSingleton<GameChangeService>(GameChangeServiceImpl());
    getIt.registerSingleton<HelldiversApiService>(HelldiversApiServiceImpl(
        baseUrl: 'https://api.helldivers2.dev/api/v1'));
  }
}
