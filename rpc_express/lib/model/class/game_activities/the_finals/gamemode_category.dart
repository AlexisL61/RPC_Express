import 'package:rpc_express/model/class/game_activities/game_activity.dart';
import 'package:rpc_express/model/class/game_activities/the_finals/gamemode.dart';

class TheFinalsGamemodeCategory with GameActivity {
  String id;
  String name;
  String image;
  String description;
  List<TheFinalsGamemode> gamemodes = [];

  TheFinalsGamemodeCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.gamemodes,
  });
}
