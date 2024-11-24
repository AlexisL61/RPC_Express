import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rpc_express/model/mvvm/view_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class InformationContainerViewModel extends EventViewModel {
  GetIt getIt = GetIt.instance;

  String packageVersion = "...";

  InformationContainerViewModel() {
    Future<PackageInfo> info = PackageInfo.fromPlatform();
    info.then((value) {
      packageVersion = value.version;
      notify();
    });
  }

  void openUrl(String url) {
    launchUrlString(url);
  }
}
