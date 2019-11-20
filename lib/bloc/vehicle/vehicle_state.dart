import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:npa_distributor/model/models.dart';

abstract class VehicleState extends Equatable {
  VehicleState([List<Object> props = const []]) : super(props);
}

class VehicleLoading extends VehicleState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "VehicleLoading";
  }
}

class VehicleLoaded extends VehicleState {
  final List<DropdownMenuItem<Vehicle>> vehicles;

  VehicleLoaded({@required this.vehicles});

  @override
  List<Object> get props => [vehicles];

  @override
  String toString() {
    return "VehicleLoaded";
  }
}

class VehicleError extends VehicleState {
  final String error;

  VehicleError({@required this.error});
  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return "VehicleError";
  }
}
