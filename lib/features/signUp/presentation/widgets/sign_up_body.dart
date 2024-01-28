
import 'package:doctor_appointment/core/helpers/spacing.dart';
import 'package:doctor_appointment/core/themes/styles.dart';
import 'package:doctor_appointment/core/widgets/app_button.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/terms_and_conditions_text.dart';
import 'package:doctor_appointment/features/signUp/data/models/sign_up_request.dart';
import 'package:doctor_appointment/features/signUp/logic/sign_up_cubit.dart';
import 'package:doctor_appointment/features/signUp/presentation/widgets/already_have_account.dart';
import 'package:doctor_appointment/features/signUp/presentation/widgets/create_account_fields.dart';
import 'package:doctor_appointment/features/signUp/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 30.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Account",
              style: TextStyles.font24BlueBold,
            ),
            verticalSpace(24),
            Text(
              "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
              style: TextStyles.font14GrayRegular,
            ),
            verticalSpace(24),
            const CreateAccountFields(),
            verticalSpace(24),
            AppTextButton(
              buttonText: 'Sign Up',
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () {
                validateThenSignUp(context);
              },
            ),
            verticalSpace(16),
            const TermsAndConditionsText(),
            verticalSpace(30),
            const AlreadyHaveAccountText(),
            const SignUpBlocListener()
          ],
        ),
      ),
    );
  }

  void validateThenSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUp(
            /*SignUpRequestBody(
                email: context.read<SignUpCubit>().emailController.text,
                password: context.read<SignUpCubit>().passwordController.text,
                name: context.read<SignUpCubit>().nameController.text,
                phone: context.read<SignUpCubit>().phoneController.text,
                passwordConfirmation: context
                    .read<SignUpCubit>()
                    .passwordConfirmationController
                    .text, gender: 0),*/
          );
    }
  }
}

