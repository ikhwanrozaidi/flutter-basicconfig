// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogoutResponseModel _$LogoutResponseModelFromJson(Map<String, dynamic> json) {
  return _LogoutResponseModel.fromJson(json);
}

/// @nodoc
mixin _$LogoutResponseModel {
  String get message => throw _privateConstructorUsedError;

  /// Serializes this LogoutResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LogoutResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogoutResponseModelCopyWith<LogoutResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutResponseModelCopyWith<$Res> {
  factory $LogoutResponseModelCopyWith(
          LogoutResponseModel value, $Res Function(LogoutResponseModel) then) =
      _$LogoutResponseModelCopyWithImpl<$Res, LogoutResponseModel>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$LogoutResponseModelCopyWithImpl<$Res, $Val extends LogoutResponseModel>
    implements $LogoutResponseModelCopyWith<$Res> {
  _$LogoutResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogoutResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogoutResponseModelImplCopyWith<$Res>
    implements $LogoutResponseModelCopyWith<$Res> {
  factory _$$LogoutResponseModelImplCopyWith(_$LogoutResponseModelImpl value,
          $Res Function(_$LogoutResponseModelImpl) then) =
      __$$LogoutResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LogoutResponseModelImplCopyWithImpl<$Res>
    extends _$LogoutResponseModelCopyWithImpl<$Res, _$LogoutResponseModelImpl>
    implements _$$LogoutResponseModelImplCopyWith<$Res> {
  __$$LogoutResponseModelImplCopyWithImpl(_$LogoutResponseModelImpl _value,
      $Res Function(_$LogoutResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LogoutResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LogoutResponseModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogoutResponseModelImpl implements _LogoutResponseModel {
  const _$LogoutResponseModelImpl({required this.message});

  factory _$LogoutResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogoutResponseModelImplFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'LogoutResponseModel(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoutResponseModelImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LogoutResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutResponseModelImplCopyWith<_$LogoutResponseModelImpl> get copyWith =>
      __$$LogoutResponseModelImplCopyWithImpl<_$LogoutResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogoutResponseModelImplToJson(
      this,
    );
  }
}

abstract class _LogoutResponseModel implements LogoutResponseModel {
  const factory _LogoutResponseModel({required final String message}) =
      _$LogoutResponseModelImpl;

  factory _LogoutResponseModel.fromJson(Map<String, dynamic> json) =
      _$LogoutResponseModelImpl.fromJson;

  @override
  String get message;

  /// Create a copy of LogoutResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogoutResponseModelImplCopyWith<_$LogoutResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
