import 'package:flutter/material.dart';
import 'package:npa_distributor/model/delivery.dart';
import 'package:npa_distributor/widget/delivery_list_item.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  List<Delivery> deliveries = [Delivery(), Delivery()];
  @override
  Widget build(BuildContext context) {
    return _buildDeliveryList(deliveries);
  }

  Widget _buildDeliveryListItems(
      BuildContext context, int positon, Delivery delivery) {
    return DeliveryListItem(
      delivery: delivery,
    );
  }

  Widget _buildDeliveryList(List<Delivery> deliveries) {
    return ListView.builder(
        // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return _buildDeliveryListItems(context, index, deliveries[index]);
        },
        itemCount: deliveries.length);
  }
}
