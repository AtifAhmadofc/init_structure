import 'package:flutter/material.dart';

import 'Presentation/Screens/log_in.dart';


class AppRoute {
  Route onGenerateRoute(RouteSettings routeArguments) {
    switch (routeArguments.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const LogIn());

      case '/LogIn':
        return MaterialPageRoute(builder: (context) => const LogIn());

      // case '/EditProfile':
      //   var data = routeArguments.arguments;
      //   if (data is ParentDataModel) {
      //     return MaterialPageRoute(
      //         builder: (context) => EditProfile(parentDataModel: data));
      //   }
      //   return MaterialPageRoute(builder: (context) => const Profile());
      default:
        return MaterialPageRoute(builder: (context) => const LogIn());
    }
  }
}
