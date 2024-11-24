import 'package:get_it/get_it.dart';
import 'package:rpc_express/model/class/user_data/user_data.dart';
import 'package:rpc_express/model/mvvm/view_model.dart';
import 'package:rpc_express/services/common/discord_service.dart';

class DiscordContainerViewModel extends EventViewModel {
  GetIt getIt = GetIt.instance;

  late DiscordService discordService;

  UserData? userData;

  DiscordContainerViewModel({DiscordService? discordService}) {
    this.discordService = discordService ?? getIt.get<DiscordService>();
    print(this.discordService);
    this.discordService.addRpcListener(updateRpc);
  }

  void updateRpc(UserData? userData) {
    this.userData = userData;
    notify();
  }
}
