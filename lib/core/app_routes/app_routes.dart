import 'package:doctor_appointment/core/app_routes/Routes.dart';
import 'package:doctor_appointment/features/login/presentation/login.dart';
import 'package:doctor_appointment/features/on_boarding/presentation/on_boarding.dart';
import 'package:flutter/material.dart';

class AppRouter {
 static MaterialPageRoute generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoarding(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const Login(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
