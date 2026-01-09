// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OtpResponseModel _$OtpResponseModelFromJson(Map<String, dynamic> json) {
  return _OtpResponseModel.fromJson(json);
}

/// @nodoc
mixin _$OtpResponseModel {
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'otpId')
  String? get otpId => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiresIn')
  int? get expiresIn => throw _privateConstructorUsedError;

  /// Serializes this OtpResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpResponseModelCopyWith<OtpResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpResponseModelCopyWith<$Res> {
  factory $OtpResponseModelCopyWith(
          OtpResponseModel value, $Res Function(OtpResponseModel) then) =
      _$OtpResponseModelCopyWithImpl<$Res, OtpResponseModel>;
  @useResult
  $Res call(
      {String message,
      @JsonKey(name: 'otpId') String? otpId,
      @JsonKey(name: 'expiresIn') int? expiresIn});
}

/// @nodoc
class _$OtpResponseModelCopyWithImpl<$Res, $Val extends OtpResponseModel>
    implements $OtpResponseModelCopyWith<$Res> {
  _$OtpResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? otpId = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      otpId: freezed == otpId
          ? _value.otpId
          : otpId // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpResponseModelImplCopyWith<$Res>
    implements $OtpResponseModelCopyWith<$Res> {
  factory _$$OtpResponseModelImplCopyWith(_$OtpResponseModelImpl value,
          $Res Function(_$OtpResponseModelImpl) then) =
      __$$OtpResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      @JsonKey(name: 'otpId') String? otpId,
      @JsonKey(name: 'expiresIn') int? expiresIn});
}

/// @nodoc
class __$$OtpResponseModelImplCopyWithImpl<$Res>
    extends _$OtpResponseModelCopyWithImpl<$Res, _$OtpResponseModelImpl>
    implements _$$OtpResponseModelImplCopyWith<$Res> {
  __$$OtpResponseModelImplCopyWithImpl(_$OtpResponseModelImpl _value,
      $Res Function(_$OtpResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? otpId = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_$OtpResponseModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      otpId: freezed == otpId
          ? _value.otpId
          : otpId // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtpResponseModelImpl implements _OtpResponseModel {
  const _$OtpResponseModelImpl(
      {required this.message,
      @JsonKey(name: 'otpId') this.otpId,
      @JsonKey(name: 'expiresIn') this.expiresIn});

  factory _$OtpResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpResponseModelImplFromJson(json);

  @override
  final String message;
  @override
  @JsonKey(name: 'otpId')
  final String? otpId;
  @override
  @JsonKey(name: 'expiresIn')
  final int? expiresIn;

  @override
  String toString() {
    return 'OtpResponseModel(message: $message, otpId: $otpId, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpResponseModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.otpId, otpId) || other.otpId == otpId) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, otpId, expiresIn);

  /// Create a copy of OtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpResponseModelImplCopyWith<_$OtpResponseModelImpl> get copyWith =>
      __$$OtpResponseModelImplCopyWithImpl<_$OtpResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpResponseModelImplToJson(
      this,
    );
  }
}

abstract class _OtpResponseModel implements OtpResponseModel {
  const factory _OtpResponseModel(
          {required final String message,
          @JsonKey(name: 'otpId') final String? otpId,
          @JsonKey(name: 'expiresIn') final int? expiresIn}) =
      _$OtpResponseModelImpl;

  factory _OtpResponseModel.fromJson(Map<String, dynamic> json) =
      _$OtpResponseModelImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(name: 'otpId')
  String? get otpId;
  @override
  @JsonKey(name: 'expiresIn')
  int? get expiresIn;

  /// Create a copy of OtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpResponseModelImplCopyWith<_$OtpResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
