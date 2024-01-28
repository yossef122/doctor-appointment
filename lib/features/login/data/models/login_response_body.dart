import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  int? code;
  bool? status;
  @JsonKey(name:"data")
  UserData? userData;

  LoginResponse(
      {required this.code,
      required this.message,
      required this.status,
      required this.userData});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: "username")
  String? userName;

  UserData({required this.token, required this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
