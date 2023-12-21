import 'package:doctor_appointment/features/login/presentation/widgets/login_Body.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: LoginScreenBody(),
      ),
    );
  }
}
