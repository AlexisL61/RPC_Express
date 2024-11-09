import 'package:games_richpresence/gen/assets.gen.dart';
import 'package:games_richpresence/model/class/user_group/sea_of_thieves/driven_ship.dart';
import 'package:games_richpresence/model/class/user_group/sea_of_thieves/ship_type.dart';

class Ship {
  static final List<Ship> ships = [
    Ship(name: "sloop", type: SeaOfThievesShipType.Sloop, maxPlayers: 2, icon: Assets.seaOfThieves.icons.sloop),
    Ship(
        name: "brigantine",
        type: SeaOfThievesShipType.Brigantine,
        maxPlayers: 3,
        icon: Assets.seaOfThieves.icons.brigantine),
    Ship(name: "galleon", type: SeaOfThievesShipType.Galleon, maxPlayers: 4, icon: Assets.seaOfThieves.icons.galleon),
  ];

  final String name;
  final SeaOfThievesShipType type;
  final int maxPlayers;
  final String icon;

  Ship({required this.name, required this.type, required this.icon, this.maxPlayers = 4});

  SeaOfThievesDrivenShip toDrivenShip(int players) {
    return SeaOfThievesDrivenShip(name: name, type: type, icon: icon, players: players, maxPlayers: maxPlayers);
  }
}
