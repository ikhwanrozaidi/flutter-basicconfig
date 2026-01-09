import 'package:json_annotation/json_annotation.dart';

part 'auth_tokens.g.dart';

@JsonSerializable()
class AuthTokens {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;
  final int? refreshExpiresIn;

  const AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    this.tokenType = 'Bearer',
    required this.expiresIn,
    this.refreshExpiresIn,
  });

  factory AuthTokens.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokensToJson(this);

  AuthTokens copyWith({
    String? accessToken,
    String? refreshToken,
    String? tokenType,
    int? expiresIn,
    int? refreshExpiresIn,
  }) {
    return AuthTokens(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      tokenType: tokenType ?? this.tokenType,
      expiresIn: expiresIn ?? this.expiresIn,
      refreshExpiresIn: refreshExpiresIn ?? this.refreshExpiresIn,
    );
  }
}
