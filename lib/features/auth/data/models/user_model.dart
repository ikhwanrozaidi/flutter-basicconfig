import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String email,
    required String username,
    @JsonKey(name: 'fullName') required String fullName,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'profilePicture') String? profilePicture,
    @JsonKey(name: 'isEmailVerified') required bool isEmailVerified,
    @JsonKey(name: 'isPhoneVerified') required bool isPhoneVerified,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Convert Model to Entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      username: username,
      fullName: fullName,
      phoneNumber: phoneNumber,
      profilePicture: profilePicture,
      isEmailVerified: isEmailVerified,
      isPhoneVerified: isPhoneVerified,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  // Convert Entity to Model
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      username: entity.username,
      fullName: entity.fullName,
      phoneNumber: entity.phoneNumber,
      profilePicture: entity.profilePicture,
      isEmailVerified: entity.isEmailVerified,
      isPhoneVerified: entity.isPhoneVerified,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
