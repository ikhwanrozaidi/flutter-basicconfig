// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestModelImpl _$$LoginRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginRequestModelImpl(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$LoginRequestModelImplToJson(
        _$LoginRequestModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_$OtpRequestModelImpl _$$OtpRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OtpRequestModelImpl(
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$OtpRequestModelImplToJson(
        _$OtpRequestModelImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
    };

_$VerifyOtpRequestModelImpl _$$VerifyOtpRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpRequestModelImpl(
      phoneNumber: json['phoneNumber'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$$VerifyOtpRequestModelImplToJson(
        _$VerifyOtpRequestModelImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'otp': instance.otp,
    };
