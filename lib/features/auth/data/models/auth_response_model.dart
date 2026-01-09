import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/auth_tokens.dart';
import 'user_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const AuthResponseModel._();

  const factory AuthResponseModel({
    required UserModel user,
    required String accessToken,
    required String refreshToken,
    @JsonKey(name: 'tokenType') @Default('Bearer') String tokenType,
    @JsonKey(name: 'expiresIn') required int expiresIn,
    @JsonKey(name: 'refreshExpiresIn') int? refreshExpiresIn,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  // Convert to AuthTokens entity
  AuthTokens toTokensEntity() {
    return AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
      refreshExpiresIn: refreshExpiresIn,
    );
  }
}
