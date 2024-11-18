import 'package:easy_localization/easy_localization.dart';
import 'package:rpc_express/model/class/game_activities/sea_of_thieves/activity.dart';
import 'package:rpc_express/model/class/user_data/user_data.dart';
import 'package:rpc_express/model/class/user_group/sea_of_thieves/driven_ship.dart';

class SeaOfThievesUserData extends UserData {
  SeaOfThievesDrivenShip? drivenShip;
  SeaOfThievesActivity? activity;

  String Function(String) onlineTranslate;

  SeaOfThievesUserData({this.drivenShip, this.activity, required this.onlineTranslate});

  @override
  String? getRpcDetails() {
    if (activity == null) {
      return tr("_sot_ship_rpc_no_activity");
    } else {
      return onlineTranslate(activity!.rpc);
    }
  }

  @override
  String? getRpcLargeImageKey() {
    return activity?.image;
  }

  @override
  String? getRpcLargeImageText() {
    if (activity != null) {
      return onlineTranslate(activity!.name);
    } else {
      return tr("_sot_ship_rpc_no_activity");
    }
  }

  @override
  String? getRpcState() {
    if (drivenShip != null) {
      return tr("_sot_ship_rpc", namedArgs: {
        "ship": tr("_sot_${drivenShip!.name}_name"),
        "players": drivenShip!.players.toString(),
        "max_players": drivenShip!.maxPlayers.toString(),
      });
    }
    return null;
  }

  @override
  String? getRpcSmallImageKey() {
    return drivenShip?.icon;
  }

  @override
  String? getRpcSmallImageText() {
    if (drivenShip != null) {
      return tr("_sot_${drivenShip!.name}_name");
    }
    return null;
  }
}
