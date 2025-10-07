// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthErrorModel _$AuthErrorModelFromJson(Map<String, dynamic> json) =>
    AuthErrorModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      errors: json['errors'] == null
          ? null
          : ErrorsModel.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthErrorModelToJson(AuthErrorModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'errors': instance.errors,
    };

ErrorsModel _$ErrorsModelFromJson(Map<String, dynamic> json) => ErrorsModel(
  email: (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
  password: (json['password'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  generalErrors: (json['generalErrors'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  firstName: (json['firstName'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  lastName: (json['lastName'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  otp: (json['otp'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ErrorsModelToJson(ErrorsModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'generalErrors': instance.generalErrors,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'otp': instance.otp,
    };
