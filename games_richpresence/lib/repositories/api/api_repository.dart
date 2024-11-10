import 'package:http/http.dart';

abstract class ApiRepository {
  Future<dynamic> fetch(String url);
}

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<dynamic> fetch(String url) async {
    print("Fetching data from $url");
    return (await get(Uri.parse(url))).body;
  }
}
