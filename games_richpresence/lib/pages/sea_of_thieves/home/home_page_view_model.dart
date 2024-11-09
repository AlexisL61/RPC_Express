import 'package:games_richpresence/model/class/user_data/sea_of_thieves_user_data.dart';
import 'package:games_richpresence/model/mvvm/view_model.dart';
import 'package:games_richpresence/services/online_translation_service.dart';
import 'package:get_it/get_it.dart';

class SeaOfThievesHomePageViewModel extends EventViewModel {
  SeaOfThievesUserData? userData;

  final GetIt getIt = GetIt.instance;
  late OnlineTranslationsService translationService;

  SeaOfThievesHomePageViewModel({OnlineTranslationsService? translationService}) {
    this.translationService = translationService ?? getIt.get<OnlineTranslationsService>();
  }

  void onActivityClick() {
    notify();
  }
}
