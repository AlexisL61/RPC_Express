import 'package:games_richpresence/model/class/game_activities/helldivers/planets.dart';
import 'package:games_richpresence/model/mvvm/view_model.dart';
import 'package:games_richpresence/services/helldivers/helldivers_api_service.dart';
import 'package:get_it/get_it.dart';

class HelldiversPlanetSelectPageViewModel extends EventViewModel {
  GetIt getIt = GetIt.instance;

  late HelldiversApiService _apiService;
  List<HelldiversPlanet> planets = [];
  bool isLoading = true;

  HelldiversPlanetSelectPageViewModel({HelldiversApiService? apiService}) {
    _apiService = apiService ?? getIt.get<HelldiversApiService>();
    fetchPlanets();
  }

  void fetchPlanets() async {
    planets = await _apiService.fetchPlanets();
    isLoading = false;
    notify();
  }

  onPlanetClick(HelldiversPlanet planet) {}
}
