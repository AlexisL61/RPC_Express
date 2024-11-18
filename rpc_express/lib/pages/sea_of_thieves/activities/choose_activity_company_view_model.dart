import 'package:rpc_express/model/class/game_activities/sea_of_thieves/activity.dart';
import 'package:rpc_express/model/class/game_activities/sea_of_thieves/activity_company.dart';
import 'package:rpc_express/model/mvvm/view_events/pop_route_event.dart';
import 'package:rpc_express/model/mvvm/view_events/push_route_event.dart';
import 'package:rpc_express/model/mvvm/view_model.dart';
import 'package:rpc_express/pages/sea_of_thieves/activities/choose_activity.dart';
import 'package:rpc_express/services/common/activity_service.dart';
import 'package:rpc_express/services/common/online_translation_service.dart';
import 'package:get_it/get_it.dart';

class ChooseActivityCompanyViewModel extends EventViewModel {
  GetIt getIt = GetIt.instance;

  late ActivityService _activityService;
  late OnlineTranslationsService translationService;

  List<SeaOfThievesActivityCompany> activityCompanies = [];

  ChooseActivityCompanyViewModel({ActivityService? activityService, OnlineTranslationsService? translationService}) {
    _activityService = activityService ?? getIt.get<ActivityService>();
    this.translationService = translationService ?? getIt.get<OnlineTranslationsService>();
    activityCompanies = _activityService.activities.map((e) => e as SeaOfThievesActivityCompany).toList();
  }

  void onActivityCompanySelected(SeaOfThievesActivityCompany activityCompany) async {
    SeaOfThievesActivity? activity = await notify(PushRouteEvent(ChooseActivityRoute.route, arguments: activityCompany)) as SeaOfThievesActivity?;
    if (activity == null) return;
    await notify(PopRouteEvent(arguments: activity));
  }
}
