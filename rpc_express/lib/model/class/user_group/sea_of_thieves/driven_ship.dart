import 'package:rpc_express/model/class/user_group/sea_of_thieves/ship.dart';
import 'package:rpc_express/model/class/user_group/sea_of_thieves/ship_type.dart';

class SeaOfThievesDrivenShip extends SeaOfThievesShip {
  final int players;

  SeaOfThievesDrivenShip(
      {required String name,
      required SeaOfThievesShipType type,
      required String icon,
      required this.players,
      required int maxPlayers})
      : super(name: name, type: type, icon: icon, maxPlayers: maxPlayers);
}
