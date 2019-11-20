import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class UserApiClient {
  static const baseUrl = "";
  final http.Client httpClient;

  UserApiClient({@required this.httpClient});
}
