import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:npa_distributor/repositories/vehicle/vehicle.dart';
import './vehicle.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRepository vehicleRepository;

  VehicleBloc({@required this.vehicleRepository})
      : assert(vehicleRepository != null);

  @override
  VehicleState get initialState => VehicleLoading();

  @override
  Stream<VehicleState> mapEventToState(
    VehicleEvent event,
  ) async* {
    if (event is FetchVehicles) {
      yield VehicleLoading();

      try {
        await vehicleRepository.getVehicles();
        final vehicles = vehicleRepository.getDropdownMenuItems();

        yield VehicleLoaded(vehicles: vehicles);
      } catch (ex) {
        yield VehicleError(error: ex.toString());
      }
    }
  }
}
