import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_response_model.freezed.dart';
part 'logout_response_model.g.dart';

@freezed
class LogoutResponseModel with _$LogoutResponseModel {
  const factory LogoutResponseModel({required String message}) =
      _LogoutResponseModel;

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseModelFromJson(json);
}
