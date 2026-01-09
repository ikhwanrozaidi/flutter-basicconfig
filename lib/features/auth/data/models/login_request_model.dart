import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

@freezed
class LoginRequestModel with _$LoginRequestModel {
  const factory LoginRequestModel({
    required String email,
    required String password,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
}

@freezed
class OtpRequestModel with _$OtpRequestModel {
  const factory OtpRequestModel({
    @JsonKey(name: 'phoneNumber') required String phoneNumber,
  }) = _OtpRequestModel;

  factory OtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestModelFromJson(json);
}

@freezed
class VerifyOtpRequestModel with _$VerifyOtpRequestModel {
  const factory VerifyOtpRequestModel({
    @JsonKey(name: 'phoneNumber') required String phoneNumber,
    required String otp,
  }) = _VerifyOtpRequestModel;

  factory VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestModelFromJson(json);
}
