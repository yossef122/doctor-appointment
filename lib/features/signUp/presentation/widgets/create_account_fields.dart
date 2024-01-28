import 'package:doctor_appointment/core/helpers/app_regex.dart';
import 'package:doctor_appointment/core/helpers/spacing.dart';
import 'package:doctor_appointment/core/widgets/app_text_formField.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/password_validations.dart';
import 'package:doctor_appointment/features/signUp/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountFields extends StatefulWidget {
  const CreateAccountFields({Key? key}) : super(key: key);

  @override
  State<CreateAccountFields> createState() => _CreateAccountFieldsState();
}

class _CreateAccountFieldsState extends State<CreateAccountFields> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;
  bool isObscureText1 = true;
  bool isObscureText2 = true;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a valid Name';
              }
            },
            controller: context.read<SignUpCubit>().nameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: "number",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'please enter a valid number';
              }
            },
            controller: context.read<SignUpCubit>().phoneController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: "email",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'please enter a valid email';
              }
            },
            controller: context.read<SignUpCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: "password",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'please enter a valid password';
              }
            },
            controller: context.read<SignUpCubit>().passwordController,
            isObscureText: isObscureText1,
            suffixIcon: IconButton(
              icon: Icon(
                  isObscureText1 ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(
                  () {
                    isObscureText1 = !isObscureText1;
                  },
                );
              },
            ),
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: "password confirmation",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'please enter a valid password confirmation';
              }
            },
            isObscureText: isObscureText2,
            suffixIcon: IconButton(
              icon: Icon(
                  isObscureText2 ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  isObscureText2 = !isObscureText2;
                });
              },
            ),
            controller:
                context.read<SignUpCubit>().passwordConfirmationController,
          ),
          verticalSpace(18),
          PasswordValidations(
            hasLowercase: hasLowercase,
            hasUppercase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();

    super.dispose();
  }
}
