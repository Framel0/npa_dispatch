import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:npa_distributor/model/models.dart';

class VehicleApiClient {
  static const baseUrl = "";
  final http.Client httpClient;

  VehicleApiClient({@required this.httpClient});

  Future<List<Vehicle>> fetchVehicles() async {
    final vehicleUrl = "$baseUrl/api/VehicleApi/Vehicle";
    final vehicleResponse = await this.httpClient.get(vehicleUrl);

    if (vehicleResponse.statusCode != 200) {
      print(vehicleResponse.statusCode);
      throw Exception('error getting vehicle');
    }

    final reponse = jsonDecode(vehicleResponse.body);
    var vehicle = reponse["model"];
    List<Vehicle> vehicleList = [];
    for (var v in vehicle) {
      vehicleList.add(Vehicle.fromJson(v));
    }

    return vehicleList;
  }
}
