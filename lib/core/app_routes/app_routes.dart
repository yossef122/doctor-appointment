import 'package:doctor_appointment/core/app_routes/Routes.dart';
import 'package:doctor_appointment/core/di/dependency_injection.dart';
import 'package:doctor_appointment/features/home/presentation/home_screen.dart';
import 'package:doctor_appointment/features/login/logic/login_cubit.dart';
import 'package:doctor_appointment/features/login/presentation/login.dart';
import 'package:doctor_appointment/features/on_boarding/presentation/on_boarding.dart';
import 'package:doctor_appointment/features/signUp/logic/sign_up_cubit.dart';
import 'package:doctor_appointment/features/signUp/presentation/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          builder: (_) => BlocProvider<LoginCubit>(
            create: (context) => getIt<LoginCubit>(),
            child: const Login(),
          ),
        );

        case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignUpCubit>(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
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
