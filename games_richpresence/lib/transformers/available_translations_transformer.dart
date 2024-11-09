import 'dart:convert';

import 'package:games_richpresence/model/class/translations/available_translation.dart';

class AvailableTranslationsTransformer {
  AvailableTranslation fromJson(Map<String, dynamic> json) {
    return AvailableTranslation(
      language: json['id'],
      name: json['name'],
    );
  }

  List<AvailableTranslation> fromJsonList(String json) {
    final List<dynamic> parsed = jsonDecode(json);
    return parsed.map((e) => fromJson(e)).toList();
  }
}