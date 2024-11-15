import 'package:easy_localization/easy_localization.dart';
import 'package:games_richpresence/model/class/game_activities/the_finals/gamemode.dart';
import 'package:games_richpresence/model/class/user_data/user_data.dart';
import 'package:games_richpresence/model/class/user_group/the_finals/group.dart';
import 'package:games_richpresence/utils/null_utils.dart';

class TheFinalsUserData extends UserData {
  TheFinalsGroup? group;
  TheFinalsGamemode? gamemode;

  String Function(String) onlineTranslate;

  TheFinalsUserData({this.group, this.gamemode, required this.onlineTranslate});

  @override
  String? getRpcDetails() {
    if (gamemode == null) {
      return tr("_the_finals_in_game");
    } else {
      return onlineTranslate(gamemode!.rpc);
    }
  }

  @override
  String? getRpcLargeImageKey() {
    return gamemode?.image;
  }

  @override
  String? getRpcLargeImageText() {
    return gamemode?.name.let((name) {
      return onlineTranslate(name);
    });
  }

  @override
  String? getRpcSmallImageKey() {
    return null;
  }

  @override
  String? getRpcSmallImageText() {
    return null;
  }

  @override
  String? getRpcState() {
    if (group != null) {
      return tr("_the_final_team_rpc", namedArgs: {
        "players": group!.groupSize.toString(),
        "max_players": "5",
      });
    }
    return null;
  }
}
