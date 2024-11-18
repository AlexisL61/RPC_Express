import 'package:rpc_express/model/class/game_activities/helldivers/faction.dart';
import 'package:rpc_express/model/class/game_activities/helldivers/objective.dart';
import 'package:rpc_express/model/class/game_activities/helldivers/planets.dart';

class HelldiversPlanetTransformer {
  final String _biomeImageUrl;

  HelldiversPlanetTransformer({required String biomeImageUrl}) : _biomeImageUrl = biomeImageUrl;

  HelldiversPlanet fromJson(Map<String, dynamic> json) {
    return HelldiversPlanet(
      id: json['index'] as int,
      name: json['name'] as String,
      sector: json['sector'] as String,
      position: getPosition(json),
      owner: HelldiversFactions.fromString(json['currentOwner']),
      ennemy: getEnnemy(json),
      objectiveProgression: getProgression(json),
      biomeImage: _biomeImageUrl + "/" + json['biome']["name"] + ".webp",
      objective: getObjective(json),
    );
  }

  HelldiversObjective getObjective(Map<String, dynamic> json) {
    if (json["currentOwner"] == HelldiversFactions.humans.name) {
      return HelldiversObjective.defense;
    } else {
      return HelldiversObjective.liberation;
    }
  }

  Position getPosition(Map<String, dynamic> json) {
    return Position(x: json['position']['x'], y: json['position']['y']);
  }

  HelldiversFactions? getEnnemy(Map<String, dynamic> json) {
    if (json['currentOwner'] == HelldiversFactions.humans.name) {
      if (json['event'] != null && json['event']['faction'] != null) {
        return HelldiversFactions.fromString(json['event']['faction']);
      } else {
        return null;
      }
    } else {
      return HelldiversFactions.fromString(json['currentOwner']);
    }
  }

  double? getProgression(Map<String, dynamic> json) {
    if (json['event'] != null) {
      return (json['event']['maxHealth'] - (json['event']['health']).toDouble()) / json['event']['maxHealth'];
    } else {
      return (json['maxHealth'] - (json['health'] as int).toDouble()) / json['maxHealth'];
    }
  }

  List<HelldiversPlanet> fromJsonList(data) {
    List<HelldiversPlanet> planets = ((data as List<dynamic>).map((e) => fromJson(e["planet"])).toList());
    planets.sort((a, b) => b.objectiveProgression?.compareTo(a.objectiveProgression ?? 0) ?? 0);
    return planets;
  }
}
