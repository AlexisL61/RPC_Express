import 'package:rpc_express/model/class/game_activities/helldivers/activity.dart';
import 'package:rpc_express/model/class/game_activities/helldivers/difficulties.dart';
import 'package:rpc_express/model/class/game_activities/helldivers/planets.dart';
import 'package:rpc_express/model/mvvm/view_events/pop_route_event.dart';
import 'package:rpc_express/model/mvvm/view_events/push_route_event.dart';
import 'package:rpc_express/model/mvvm/view_model.dart';
import 'package:rpc_express/pages/helldivers/activity_select/difficulty_activity_select_page.dart';
import 'package:rpc_express/services/helldivers/helldivers_api_service.dart';
import 'package:get_it/get_it.dart';

class HelldiversPlanetSelectPageViewModel extends EventViewModel {
  GetIt getIt = GetIt.instance;

  late HelldiversApiService _apiService;
  List<HelldiversPlanet> planets = [];
  HelldiversPlanet? selectedPlanet;
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

  onPlanetClick(HelldiversPlanet planet) async {
    Difficulties? difficulty = await notify(PushRouteEvent(DifficultyActivitySelectPage.route)) as Difficulties?;
    if (difficulty == null) {
      notify();
    } else {
      notify(PopRouteEvent(arguments: HelldiversActivity(difficulty: difficulty, planet: planet)));
    }
  }
}
