

import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {


  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;

  RegisterRequestBody({this.email,this.password,this.firstName,this.lastName});

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);

}