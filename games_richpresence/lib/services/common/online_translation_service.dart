import 'package:games_richpresence/model/class/translations/available_translation.dart';
import 'package:games_richpresence/services/common/api_service.dart';
import 'package:get_it/get_it.dart';

abstract class OnlineTranslationsService {
  List<AvailableTranslation> availableTranslations = [];
  Map<String, dynamic> fallbackTranslations = {};
  Map<String, dynamic> currentTranslation = {};

  Future<void> fetchAvailableTranslations();
  Future<void> fetchSpecificTranslation(String translation);
  String onlineTranslate(String translation);
}

class OnlineTranslationServiceImpl implements OnlineTranslationsService {
  final GetIt getIt = GetIt.instance;

  @override
  List<AvailableTranslation> availableTranslations = [];
  Map<String, dynamic> fallbackTranslations = {};
  Map<String, dynamic> currentTranslation = {};

  late ApiService apiService;

  OnlineTranslationServiceImpl({ApiService? apiService}) {
    this.apiService = apiService ?? getIt.get<ApiService>();
  }

  Future<void> fetchAvailableTranslations() async {
    availableTranslations = await apiService.fetchAvailableTranslations();
  }

  Future<void> fetchSpecificTranslation(String translation) async {
    fallbackTranslations = await apiService.fetchSpecificTranslation('en');
    currentTranslation = await apiService.fetchSpecificTranslation(translation);
  }

  String onlineTranslate(String translation) {
    if (currentTranslation.containsKey(translation)) {
      return currentTranslation[translation];
    } else {
      if (fallbackTranslations.containsKey(translation)) {
        return fallbackTranslations[translation];
      } else {
        print('Translation not found: ' + translation);
        return translation;
      }
    }
  }
}
