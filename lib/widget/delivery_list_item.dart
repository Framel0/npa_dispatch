import 'package:flutter/material.dart';
import 'package:npa_distributor/color.dart';
import 'package:npa_distributor/model/delivery.dart';

class DeliveryListItem extends StatelessWidget {
  final Delivery delivery;

  const DeliveryListItem({Key key, @required this.delivery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style:
                      Theme.of(context).textTheme.body1.copyWith(fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Book Date: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: colorPrimary)),
                    TextSpan(text: "07/10/2019"),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style:
                      Theme.of(context).textTheme.body1.copyWith(fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Refill Type: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: colorPrimary)),
                    TextSpan(text: "90 Kg"),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 2,
              // ),
              // RichText(
              //   maxLines: 2,
              //   overflow: TextOverflow.ellipsis,
              //   text: TextSpan(
              //     style:
              //         Theme.of(context).textTheme.body1.copyWith(fontSize: 16),
              //     children: <TextSpan>[
              //       TextSpan(
              //           text: 'Delivery Method: ',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, color: colorPrimary)),
              //       TextSpan(text: "Home Delivery"),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 2,
              ),
              RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style:
                      Theme.of(context).textTheme.body1.copyWith(fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Payment Method: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: colorPrimary)),
                    TextSpan(text: "Cash on Delivery"),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style:
                      Theme.of(context).textTheme.body1.copyWith(fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Order Reference number: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: colorPrimary)),
                    TextSpan(text: "2626432"),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style:
                      Theme.of(context).textTheme.body1.copyWith(fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Location: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: colorPrimary)),
                    TextSpan(text: "Laboni"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
