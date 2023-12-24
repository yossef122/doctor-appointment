import 'package:doctor_appointment/core/themes/styles.dart';
import 'package:flutter/material.dart';


class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Sign Up',
            
            style: TextStyles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
