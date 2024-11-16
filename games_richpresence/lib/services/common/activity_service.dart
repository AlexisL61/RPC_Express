import 'package:games_richpresence/model/class/game_activities/game_activity.dart';
import 'package:games_richpresence/services/common/api_service.dart';
import 'package:get_it/get_it.dart';

abstract class ActivityService {
  List<GameActivity> activities = [];
  Future<void> fetchActivities();
}

class ActivityServiceImpl implements ActivityService {
  final GetIt getIt = GetIt.instance;

  late ApiService apiService;

  @override
  List<GameActivity> activities = [];

  ActivityServiceImpl({ApiService? apiService}) {
    this.apiService = apiService ?? getIt.get<ApiService>();
  }

  @override
  Future<void> fetchActivities() async {
    activities = await apiService.fetchActivities();
  }
}
