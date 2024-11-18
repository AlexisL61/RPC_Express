import 'package:rpc_express/model/class/game_activities/helldivers/difficulties.dart';
import 'package:rpc_express/model/class/game_activities/helldivers/planets.dart';

class HelldiversActivity {
  Difficulties? difficulty;
  HelldiversPlanet? planet;

  HelldiversActivity({required this.difficulty, required this.planet});
}
