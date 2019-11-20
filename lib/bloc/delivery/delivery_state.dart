import 'package:equatable/equatable.dart';
import 'package:npa_distributor/model/models.dart';

abstract class DeliveryState extends Equatable {
  DeliveryState([List<Object> props = const []]) : super(props);
}

class DeliveryLoading extends DeliveryState {
  @override
  String toString() {
    return "DeliveryLoading";
  }
}

class DeliveryLoaded extends DeliveryState {
  final List<Delivery> deliveries;

  DeliveryLoaded(this.deliveries);
  @override
  List<Object> get props => [deliveries];

  @override
  String toString() {
    return "DeliveryLoaded";
  }
}

class DeliveryError extends DeliveryState {
  final String error;

  DeliveryError(this.error);
  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return "DeliveryError";
  }
}
