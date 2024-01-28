import 'package:doctor_appointment/core/networks/api_result.dart';
import 'package:doctor_appointment/core/networks/api_service.dart';
import 'package:doctor_appointment/features/signUp/data/models/sign_up_request.dart';
import 'package:doctor_appointment/features/signUp/data/models/sign_up_response.dart';

import '../../../../core/networks/api_error_handler.dart';

class SignUpRepository {
  final ApiService _apiService;

  SignUpRepository(this._apiService);

  Future<ApiResult<SignUpResponseBody>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    try {
      var res = await _apiService.register(signUpRequestBody);
      return ApiResult.success(res);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
