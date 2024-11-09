import 'package:games_richpresence/model/class/games/game_object.dart';
import 'package:games_richpresence/repositories/api/api_repository.dart';
import 'package:games_richpresence/services/api_service.dart';
import 'package:games_richpresence/services/game_change_service.dart';
import 'package:games_richpresence/services/online_translation_service.dart';
import 'package:games_richpresence/transformers/available_translations_transformer.dart';
import 'package:get_it/get_it.dart';
import 'package:games_richpresence/transformers/activity/activity_transformer.dart';
import 'package:games_richpresence/transformers/activity/sea_of_thieves/sea_of_thieves_activity_category_transformer.dart';
import 'package:games_richpresence/transformers/activity/sea_of_thieves/sea_of_thieves_activity_company_transformer.dart';
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
    getIt.registerSingleton<ActivityTransformer>(SeaOfThievesActivityCompanyTransformer());
  }

  initRepositories() {
    getIt.registerSingleton<ApiRepository>(ApiRepositoryImpl());
  }

  initServices() {
    getIt.registerSingleton<ApiService>(ApiServiceImpl(baseUrl: 'https://alexisl61.github.io/Games_RichPresence/api', gameObject: GameObject.seaOfThieves));
    getIt.registerSingleton<OnlineTranslationsService>(OnlineTranslationServiceImpl());
    getIt.registerSingleton<GameChangeService>(GameChangeServiceImpl());
  }
}
