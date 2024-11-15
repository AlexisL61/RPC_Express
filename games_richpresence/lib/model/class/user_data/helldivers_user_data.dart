import 'package:games_richpresence/model/class/user_data/user_data.dart';
import 'package:games_richpresence/model/class/user_group/helldivers/group.dart';

class HelldiversUserData extends UserData {
  HelldiversGroup? group;

  String Function(String) onlineTranslate;

  HelldiversUserData({this.group, required this.onlineTranslate});

  @override
  String? getRpcDetails() {
    throw UnimplementedError();
  }

  @override
  String? getRpcLargeImageKey() {
    throw UnimplementedError();
  }

  @override
  String? getRpcLargeImageText() {
    throw UnimplementedError();
  }

  @override
  String? getRpcSmallImageKey() {
    throw UnimplementedError();
  }

  @override
  String? getRpcSmallImageText() {
    throw UnimplementedError();
  }

  @override
  String? getRpcState() {
    throw UnimplementedError();
  }
}
