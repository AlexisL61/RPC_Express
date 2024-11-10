import 'package:games_richpresence/gen/assets.gen.dart';
import 'package:games_richpresence/model/class/user_group/sea_of_thieves/driven_ship.dart';
import 'package:games_richpresence/model/class/user_group/sea_of_thieves/ship_type.dart';

class SeaOfThievesShip {
  static final List<SeaOfThievesShip> ships = [
    SeaOfThievesShip(
        name: "sloop", type: SeaOfThievesShipType.Sloop, maxPlayers: 2, icon: Assets.seaOfThieves.icons.sloop),
    SeaOfThievesShip(
        name: "brigantine",
        type: SeaOfThievesShipType.Brigantine,
        maxPlayers: 3,
        icon: Assets.seaOfThieves.icons.brigantine),
    SeaOfThievesShip(
        name: "galleon", type: SeaOfThievesShipType.Galleon, maxPlayers: 4, icon: Assets.seaOfThieves.icons.galleon),
  ];

  final String name;
  final SeaOfThievesShipType type;
  final int maxPlayers;
  final String icon;

  SeaOfThievesShip({required this.name, required this.type, required this.icon, this.maxPlayers = 4});

  SeaOfThievesDrivenShip toDrivenShip(int players) {
    return SeaOfThievesDrivenShip(name: name, type: type, icon: icon, players: players, maxPlayers: maxPlayers);
  }
}
