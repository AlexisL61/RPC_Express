import 'package:easy_localization/easy_localization.dart';
import 'package:rpc_express/model/class/game_activities/helldivers/activity.dart';
import 'package:rpc_express/model/class/user_data/user_data.dart';
import 'package:rpc_express/model/class/user_group/helldivers/group.dart';

class HelldiversUserData extends UserData {
  HelldiversGroup? group;
  HelldiversActivity? activity;

  String Function(String) onlineTranslate;

  HelldiversUserData({this.group, this.activity, required this.onlineTranslate});

  @override
  String? getRpcDetails() {
    if (activity == null ||
        activity!.difficulty == null ||
        activity!.planet == null ||
        activity!.planet!.ennemy == null) {
      return tr("_helldivers_in_game");
    } else {
      return tr("_helldivers_activity_rpc", namedArgs: {
        "planet": activity!.planet!.name,
        "enemy": activity!.planet!.ennemy!.name,
        "difficulty": tr(activity!.difficulty!.name),
        "difficulty_level": activity!.difficulty!.level.toString()
      });
    }
  }

  @override
  String? getRpcLargeImageKey() {
    if (activity != null && activity!.planet != null) {
      return activity!.planet!.biomeImage;
    } else {
      return null;
    }
  }

  @override
  String? getRpcLargeImageText() {
    if (activity != null && activity!.planet != null) {
      return activity!.planet!.name;
    }
    return null;
  }

  @override
  String? getRpcSmallImageKey() {
    if (activity != null && activity!.difficulty != null) {
      return activity!.difficulty!.id;
    }
    return null;
  }

  @override
  String? getRpcSmallImageText() {
    if (activity != null && activity!.difficulty != null) {
      return tr(activity!.difficulty!.name);
    }
    return null;
  }

  @override
  String? getRpcState() {
    if (group != null) {
      return tr("_helldivers_team_rpc",
          namedArgs: {"players": group!.groupSize.toString(), "max_players": 4.toString()});
    } else {
      return null;
    }
  }
}
