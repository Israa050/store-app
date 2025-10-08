// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationRequestBody _$VerificationRequestBodyFromJson(
  Map<String, dynamic> json,
) => VerificationRequestBody(
  email: json['email'] as String?,
  otp: json['otp'] as String?,
);

Map<String, dynamic> _$VerificationRequestBodyToJson(
  VerificationRequestBody instance,
) => <String, dynamic>{'email': instance.email, 'otp': instance.otp};
