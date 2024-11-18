import 'package:http/http.dart';

abstract class ApiRepository {
  Future<dynamic> fetch(String url, {Map<String, String>? headers});
}

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<dynamic> fetch(String url, {Map<String, String>? headers}) async {
    print("Fetching data from $url");
    return (await get(Uri.parse(url), headers: headers)).body;
  }
}
