import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class DeliveryApiClient {
  static const baseUrl = "";
  final http.Client httpClient;

  DeliveryApiClient({@required this.httpClient}) : assert(httpClient != null);
}
