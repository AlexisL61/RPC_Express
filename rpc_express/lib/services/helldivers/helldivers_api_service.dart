import 'dart:convert';

import 'package:rpc_express/model/class/game_activities/helldivers/planets.dart';
import 'package:rpc_express/repositories/api/api_repository.dart';
import 'package:rpc_express/transformers/activity/helldivers/helldivers_planet_transformer.dart';
import 'package:get_it/get_it.dart';

abstract class HelldiversApiService {
  Future<List<HelldiversPlanet>> fetchPlanets();
}

class HelldiversApiServiceImpl implements HelldiversApiService {
  final GetIt _getIt = GetIt.instance;
  late ApiRepository _apiRepository;
  late HelldiversPlanetTransformer _planetTransformer;

  String _baseUrl;

  HelldiversApiServiceImpl(
      {required String baseUrl, ApiRepository? apiRepository, HelldiversPlanetTransformer? planetTransformer})
      : _baseUrl = baseUrl {
    _apiRepository = apiRepository ?? _getIt.get<ApiRepository>();
    _planetTransformer = planetTransformer ?? _getIt.get<HelldiversPlanetTransformer>();
  }

  @override
  Future<List<HelldiversPlanet>> fetchPlanets() async {
    dynamic data = await _apiRepository.fetch("$_baseUrl/campaigns", headers: {
      "X-Super-Client": "Games RichPresence",
      "X-Super-Contact": "contact@alexisl.fr",
    });
    return _planetTransformer.fromJsonList(jsonDecode(data));
  }
}
