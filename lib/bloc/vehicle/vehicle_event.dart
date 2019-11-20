import 'package:equatable/equatable.dart';

abstract class VehicleEvent extends Equatable {
  VehicleEvent([List<Object> props = const []]) : super(props);
}

class FetchVehicles extends VehicleEvent {
  @override
  String toString() {
    return "FetchVehciles";
  }
}
