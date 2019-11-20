import 'package:flutter/material.dart';
import 'package:npa_distributor/model/models.dart';
import 'package:npa_distributor/repositories/vehicle/vehicle.dart';

class VehicleRepository {
  final VehicleApiClient vehicleApiClient;

  VehicleRepository({@required this.vehicleApiClient});

  // List<Vehicle> _vehicles = [
  //   Vehicle(id: 1, code: "", name: "Full-Size Pickup"),
  //   Vehicle(id: 2, code: "", name: "Midsize Pickup"),
  //   Vehicle(id: 3, code: "", name: "Heavy Duty Pickup"),
  //   Vehicle(id: 4, code: "", name: "Compact Pickup"),
  //   Vehicle(id: 5, code: "", name: "Tricycle"),
  // ];

  List<Vehicle> _vehicles = [];

  Future<void> getVehicles() async {
    _vehicles = await vehicleApiClient.fetchVehicles();
  }

  List<Vehicle> get vehicles {
    return List.from(_vehicles);
  }

  List<DropdownMenuItem<Vehicle>> getDropdownMenuItems() {
    List<DropdownMenuItem<Vehicle>> items = List();

    for (Vehicle vehicle in _vehicles) {
      items.add(DropdownMenuItem(
        value: vehicle,
        child: Text(vehicle.name),
      ));
    }
    return items;
  }
}
