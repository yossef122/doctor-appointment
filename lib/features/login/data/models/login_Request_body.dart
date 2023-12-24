
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_Request_body.g.dart';

@JsonSerializable()
class LoginRequestBody{

  final String email;
  final String password;
  LoginRequestBody({required this.email,required this.password});

  Map<String ,dynamic>toJson()=>_$LoginRequestBodyToJson(this);

}
