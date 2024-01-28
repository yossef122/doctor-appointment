import 'package:bloc/bloc.dart';
import 'package:doctor_appointment/features/login/data/models/login_Request_body.dart';
import 'package:doctor_appointment/features/login/data/repos/login_repo.dart';
import 'package:doctor_appointment/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void emitLoadingStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    var res = await _loginRepo.login(loginRequestBody);
    res.when(
      success: (loginResponse) => {
        emit(
          LoginState.success(loginResponse),
        )
      },
      failure: (error) => {
        emit(
          LoginState.error(error: error.apiErrorModel.message ?? ""),
        )
      },
    );
  }
}
