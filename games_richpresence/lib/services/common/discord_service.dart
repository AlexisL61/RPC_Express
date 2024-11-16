import 'package:dart_discord_rpc/dart_discord_rpc_native.dart';
import 'package:dart_discord_rpc/model/discord_presence.dart';
import 'package:games_richpresence/model/class/user_data/user_data.dart';

abstract class DiscordService {
  void initialize(String clientId);
  void updateRpc(UserData userData);
}

class DiscordServiceImpl implements DiscordService {
  DiscordRPC? discordRpc;

  @override
  void initialize(String clientId) {
    if (discordRpc != null) {
      discordRpc!.shutDown();
    }
    discordRpc = DiscordRPC(applicationId: clientId);
    discordRpc!.start(autoRegister: true);
  }

  @override
  void updateRpc(UserData userData) {
    print("Updating RPC");
    
    discordRpc!.updatePresence(DiscordPresence(
      details: userData.getRpcDetails(),
      state: userData.getRpcState(),
      largeImageKey: userData.getRpcLargeImageKey(),
      largeImageText: userData.getRpcLargeImageText(),
      smallImageKey: userData.getRpcSmallImageKey(),
      smallImageText: userData.getRpcSmallImageText(),
      startTimeStamp: DateTime.now().millisecondsSinceEpoch,
    ));
  }
}
