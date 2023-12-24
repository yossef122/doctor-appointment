import 'package:doctor_appointment/core/networks/api_error_handler.dart';
import 'package:doctor_appointment/core/networks/api_result.dart';
import 'package:doctor_appointment/core/networks/api_service.dart';
import 'package:doctor_appointment/features/login/data/models/login_Request_body.dart';
import 'package:doctor_appointment/features/login/data/models/login_response_body.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
