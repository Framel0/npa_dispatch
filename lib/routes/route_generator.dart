import 'package:flutter/material.dart';
import 'package:npa_distributor/page/pages.dart';
import 'package:npa_distributor/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case deliveryRoute:
        return MaterialPageRoute(builder: (_) => DeliveryPage());
        break;
      case deliveryDetailRoute:
        return MaterialPageRoute(builder: (_) => DeliveryDetailsPage());
        break;
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case loginRoute:
        return MaterialPageRoute(
            builder: (_) => LoginPage(
                  userRepository: args,
                ));
        break;
      case registrationRoute:
        return MaterialPageRoute(
            builder: (_) => RegisterPage(
                  userRepository: args,
                ));
        break;
      default:
    }
  }
}
