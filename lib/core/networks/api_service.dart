import 'package:doctor_appointment/features/login/data/models/login_Request_body.dart';
import 'package:doctor_appointment/features/login/data/models/login_response_body.dart';
import 'package:doctor_appointment/core/networks/api_constants.dart';

import 'package:dio/dio.dart';
import 'package:doctor_appointment/features/signUp/data/models/sign_up_request.dart';
import 'package:doctor_appointment/features/signUp/data/models/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.register)
  Future<SignUpResponseBody> register(
      @Body() SignUpRequestBody signUpRequestBody);
}
