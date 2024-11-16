import 'package:games_richpresence/model/class/game_activities/helldivers/faction.dart';

class HelldiversPlanet {
  final int id;
  final String name;
  final String sector;
  final String biomeImage;
  final Position position;
  final HelldiversFactions owner;

  HelldiversPlanet(
      {required this.id,
      required this.name,
      required this.sector,
      required this.biomeImage,
      required this.position,
      required this.owner});
}

class Position {
  final double x;
  final double y;

  Position({required this.x, required this.y});
}
