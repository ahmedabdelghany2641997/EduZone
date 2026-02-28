import 'package:flutter/material.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (context){
          return Container();
        });
      case AppRoutes.goldScreen:
        return MaterialPageRoute(builder: (context){
          return Container();
        });

      case AppRoutes.SilverScreen:
        return MaterialPageRoute(builder: (context){
          return Container();
        });

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );

    }
  }
}