import 'package:dart_discord_rpc/dart_discord_rpc_native.dart';
import 'package:dart_discord_rpc/model/discord_presence.dart';
import 'package:rpc_express/model/class/user_data/user_data.dart';

abstract class DiscordService {
  void initialize(String clientId);
  void updateRpc(UserData userData);
  void addRpcListener(Function(UserData?) listener);
  void removeRpcListener(Function(UserData?) listener);
}

class DiscordServiceImpl implements DiscordService {
  DiscordRPC? discordRpc;
  List<Function(UserData?)> rpcListeners = [];
  bool showRpcExpressButton = true;

  @override
  void initialize(String clientId) {
    if (discordRpc != null) {
      discordRpc!.shutDown();
    }
    discordRpc = DiscordRPC(applicationId: clientId);
    discordRpc!.start(autoRegister: true);
    notifyListeners(null);
  }

  @override
  void updateRpc(UserData userData) {
    discordRpc!.updatePresence(DiscordPresence(
      details: userData.getRpcDetails(),
      state: userData.getRpcState(),
      largeImageKey: userData.getRpcLargeImageKey(),
      largeImageText: userData.getRpcLargeImageText(),
      smallImageKey: userData.getRpcSmallImageKey(),
      smallImageText: userData.getRpcSmallImageText(),
      startTimeStamp: DateTime.now().millisecondsSinceEpoch,
    ));

    notifyListeners(userData);
  }

  void addRpcListener(Function(UserData?) listener) {
    rpcListeners.add(listener);
  }

  void removeRpcListener(Function(UserData?) listener) {
    rpcListeners.remove(listener);
  }

  void notifyListeners(UserData? userData) {
    rpcListeners.forEach((Function(UserData?) listener) {
      listener(userData);
    });
  }
}
