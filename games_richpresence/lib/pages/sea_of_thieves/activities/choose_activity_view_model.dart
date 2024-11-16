import 'package:games_richpresence/model/class/game_activities/sea_of_thieves/activity.dart';
import 'package:games_richpresence/model/mvvm/view_events/pop_route_event.dart';
import 'package:games_richpresence/model/mvvm/view_model.dart';
import 'package:games_richpresence/services/common/online_translation_service.dart';
import 'package:get_it/get_it.dart';

class ChooseActivityViewModel extends EventViewModel {
  final GetIt getIt = GetIt.instance;

  late OnlineTranslationsService translationService;

  ChooseActivityViewModel({OnlineTranslationsService? translationService}) {
    this.translationService = translationService ?? getIt.get<OnlineTranslationsService>();
  }

  void onActivitySelected(SeaOfThievesActivity activity) async {
    await notify(PopRouteEvent(arguments: activity));
  }
}