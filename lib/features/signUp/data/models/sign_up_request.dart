import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String name;
  final String email;
  final String phone;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  final int gender;

  SignUpRequestBody(
      {required this.passwordConfirmation,
      required this.name,
      required this.email,
      required this.phone,
      required this.gender,
      required this.password});


  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
