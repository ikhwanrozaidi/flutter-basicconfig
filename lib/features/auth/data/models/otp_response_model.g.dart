// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpResponseModelImpl _$$OtpResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OtpResponseModelImpl(
      message: json['message'] as String,
      otpId: json['otpId'] as String?,
      expiresIn: (json['expiresIn'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OtpResponseModelImplToJson(
        _$OtpResponseModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'otpId': instance.otpId,
      'expiresIn': instance.expiresIn,
    };
