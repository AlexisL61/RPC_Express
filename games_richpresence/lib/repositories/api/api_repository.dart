import 'dart:convert';

import 'package:http/http.dart';

abstract class ApiRepository {
  Future<dynamic> fetch(String url);
}

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<dynamic> fetch(String url) async {
    return jsonDecode((await get(Uri.parse(url))).body);
  }
}
