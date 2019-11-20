import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class DeliveryEvent extends Equatable {
  DeliveryEvent([List<Object> props = const []]) : super(props);
}

class FetchDeliveries extends DeliveryEvent {
  @override
  String toString() {
    return "FetchDeliveries";
  }
}
