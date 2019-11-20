import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:npa_distributor/repositories/delivery/delivery.dart';
import './delivery.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  final DeliveryRepository deliveryRepository;

  DeliveryBloc({@required this.deliveryRepository});

  @override
  DeliveryState get initialState => DeliveryLoading();

  @override
  Stream<DeliveryState> mapEventToState(
    DeliveryEvent event,
  ) async* {
    if (event is FetchDeliveries) {}
  }
}
