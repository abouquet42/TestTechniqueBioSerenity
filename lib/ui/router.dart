import 'package:flutter/material.dart';
import 'package:test_bio_serenity/core/models/car.dart';
import 'package:test_bio_serenity/core/models/navigation/arguments/car_details_arguments.dart';
import 'package:test_bio_serenity/ui/car_details.dart';

import 'home.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final dynamicArguments = routeSettings.arguments;
    // Instantiate the default route here
    Widget route = Scaffold(
      body: Center(
        child: Text('No route defined for ${routeSettings.name}'),
      ),
    );
    switch (routeSettings.name) {
      case Home.routeName:
        route = Home();
        break;
      case CarDetails.routeName:
        Car car;
        if (dynamicArguments is CarDetailsArguments) {
          car = dynamicArguments.car;
          route = CarDetails(
            car: car,
          );
        }
        break;
    }
    return MaterialPageRoute<dynamic>(builder: (BuildContext context) => route);
  }
}
