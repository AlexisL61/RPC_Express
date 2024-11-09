import 'dart:convert';

import 'package:games_richpresence/model/class/game_activities/game_activity.dart';
import 'package:games_richpresence/model/class/games/game_object.dart';
import 'package:games_richpresence/model/class/translations/available_translation.dart';
import 'package:games_richpresence/repositories/api/api_repository.dart';
import 'package:games_richpresence/transformers/activity/activity_transformer.dart';
import 'package:games_richpresence/transformers/available_translations_transformer.dart';
import 'package:get_it/get_it.dart';

abstract class ApiService {
  Future<List<AvailableTranslation>> fetchAvailableTranslations();
  Future<Map<String, dynamic>> fetchSpecificTranslation(String translation);
  Future<GameActivity> fetchActivity();
  void changeGame(GameObject gameObject);
}

class ApiServiceImpl implements ApiService {
  final GetIt _getIt = GetIt.instance;

  String _baseUrl;
  GameObject _gameObject;

  late ApiRepository _apiRepository;
  late AvailableTranslationsTransformer _availableTranslationsTransformer;
  late ActivityTransformer _activityTransformer;

  ApiServiceImpl(
      {required String baseUrl,
      required GameObject gameObject,
      ApiRepository? apiRepository,
      AvailableTranslationsTransformer? availableTranslationsTransformer})
      : _gameObject = gameObject,
        _baseUrl = baseUrl {
    _apiRepository = apiRepository ?? _getIt.get<ApiRepository>();
    _availableTranslationsTransformer =
        availableTranslationsTransformer ?? _getIt.get<AvailableTranslationsTransformer>();
    _activityTransformer = _getIt.get<ActivityTransformer>();
  }

  @override
  Future<List<AvailableTranslation>> fetchAvailableTranslations() async {
    dynamic data = await _apiRepository.fetch("$_baseUrl/${_gameObject.id}/translations/available_translations.json");
    return _availableTranslationsTransformer.fromJsonList(data);
  }

  @override
  Future<Map<String, dynamic>> fetchSpecificTranslation(String translation) async {
    return jsonDecode(await _apiRepository.fetch("$_baseUrl/${_gameObject.id}/translations/$translation.json"));
  }

  Future<GameActivity> fetchActivity() async {
    dynamic data = await _apiRepository.fetch("$_baseUrl/${_gameObject.id}/activity.json");
    return _activityTransformer.fromJson(data);
  }

  void changeGame(GameObject gameObject) {
    _gameObject = gameObject;
  }
}
