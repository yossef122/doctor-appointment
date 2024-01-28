import 'package:doctor_appointment/core/helpers/spacing.dart';
import 'package:doctor_appointment/core/themes/styles.dart';
import 'package:doctor_appointment/core/widgets/app_button.dart';
import 'package:doctor_appointment/features/login/data/models/login_Request_body.dart';
import 'package:doctor_appointment/features/login/logic/login_cubit.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/LoginBlocListener.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/alreadyHaveAccount.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/email_and_password.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  // final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 30.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back",
              style: TextStyles.font24BlueBold,
            ),
            verticalSpace(8),
            Text(
              "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
              style: TextStyles.font14GrayRegular,
            ),
            verticalSpace(36),
            Column(
              children: [
                const EmailAndPassword(),
                verticalSpace(24),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "forget Password",
                    style: TextStyles.font13blueRegular,
                  ),
                ),
                verticalSpace(24),
                AppTextButton(
                  buttonText: 'login',
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    validateThenLogin(context);
                  },
                ),
                verticalSpace(16),
                const TermsAndConditionsText(),
                verticalSpace(60),
                const AlreadyHaveAccountText(),
                const LoginBlocListener(),
              ],
            )
          ],
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoadingStates(
            LoginRequestBody(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
          );
    }
  }
}
