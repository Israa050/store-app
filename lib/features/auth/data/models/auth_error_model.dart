

import 'package:json_annotation/json_annotation.dart';

part 'auth_error_model.g.dart';

@JsonSerializable()
class AuthErrorModel{
  final int? statusCode;
  final String? message;
  final ErrorsModel? errors;

  AuthErrorModel({this.statusCode,this.message,this.errors});

  factory AuthErrorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthErrorModelFromJson(json);
}



@JsonSerializable()
class ErrorsModel{
  final List<String>? email;
  final List<String>? password;
  final List<String>? generalErrors;
  final List<String>? firstName;
  final List<String>? lastName;
  final List<String>? otp;

  ErrorsModel({this.email,this.password,this.generalErrors,this.firstName,this.lastName,this.otp});

   factory ErrorsModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorsModelFromJson(json);

}