import 'package:bloc/bloc.dart';
import 'package:doctor_appointment/features/signUp/data/models/sign_up_request.dart';
import 'package:doctor_appointment/features/signUp/data/repos/sign_up_repository.dart';
import 'package:doctor_appointment/features/signUp/logic/sign_up_state.dart';
import 'package:flutter/material.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository _signUpRepository;
  final formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  SignUpCubit(this._signUpRepository) : super(const SignUpState.initial());

  void emitSignUp() async {
    emit(const SignUpState.loading());
    // var res = await _signUpRepository.signUp(signUpRequestBody);
    final res = await _signUpRepository.signUp(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    res.when(success: (signUpResponseBody) {
      emit(SignUpState.success(signUpResponseBody));
    }, failure: (error) {
      emit(SignUpState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}

//            jo@Aaaaaaa1
