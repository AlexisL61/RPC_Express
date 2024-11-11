import 'package:games_richpresence/model/class/user_data/user_data.dart';
import 'package:games_richpresence/model/class/user_group/the_finals/group.dart';

class TheFinalsUserData extends UserData {
  TheFinalsGroup? group;

  String Function(String) onlineTranslate;

  TheFinalsUserData({this.group, required this.onlineTranslate});
  
  @override
  String? getRpcDetails() {
    // TODO: implement getRpcDetails
    throw UnimplementedError();
  }
  
  @override
  String? getRpcLargeImageKey() {
    // TODO: implement getRpcLargeImageKey
    throw UnimplementedError();
  }
  
  @override
  String? getRpcLargeImageText() {
    // TODO: implement getRpcLargeImageText
    throw UnimplementedError();
  }
  
  @override
  String? getRpcSmallImageKey() {
    // TODO: implement getRpcSmallImageKey
    throw UnimplementedError();
  }
  
  @override
  String? getRpcSmallImageText() {
    // TODO: implement getRpcSmallImageText
    throw UnimplementedError();
  }
  
  @override
  String? getRpcState() {
    // TODO: implement getRpcState
    throw UnimplementedError();
  }
}