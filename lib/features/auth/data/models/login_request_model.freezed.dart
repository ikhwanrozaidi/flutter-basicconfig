// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) {
  return _LoginRequestModel.fromJson(json);
}

/// @nodoc
mixin _$LoginRequestModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this LoginRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestModelCopyWith<LoginRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestModelCopyWith<$Res> {
  factory $LoginRequestModelCopyWith(
          LoginRequestModel value, $Res Function(LoginRequestModel) then) =
      _$LoginRequestModelCopyWithImpl<$Res, LoginRequestModel>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginRequestModelCopyWithImpl<$Res, $Val extends LoginRequestModel>
    implements $LoginRequestModelCopyWith<$Res> {
  _$LoginRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginRequestModelImplCopyWith<$Res>
    implements $LoginRequestModelCopyWith<$Res> {
  factory _$$LoginRequestModelImplCopyWith(_$LoginRequestModelImpl value,
          $Res Function(_$LoginRequestModelImpl) then) =
      __$$LoginRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginRequestModelImplCopyWithImpl<$Res>
    extends _$LoginRequestModelCopyWithImpl<$Res, _$LoginRequestModelImpl>
    implements _$$LoginRequestModelImplCopyWith<$Res> {
  __$$LoginRequestModelImplCopyWithImpl(_$LoginRequestModelImpl _value,
      $Res Function(_$LoginRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginRequestModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestModelImpl implements _LoginRequestModel {
  const _$LoginRequestModelImpl({required this.email, required this.password});

  factory _$LoginRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestModelImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginRequestModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestModelImplCopyWith<_$LoginRequestModelImpl> get copyWith =>
      __$$LoginRequestModelImplCopyWithImpl<_$LoginRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestModelImplToJson(
      this,
    );
  }
}

abstract class _LoginRequestModel implements LoginRequestModel {
  const factory _LoginRequestModel(
      {required final String email,
      required final String password}) = _$LoginRequestModelImpl;

  factory _LoginRequestModel.fromJson(Map<String, dynamic> json) =
      _$LoginRequestModelImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestModelImplCopyWith<_$LoginRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OtpRequestModel _$OtpRequestModelFromJson(Map<String, dynamic> json) {
  return _OtpRequestModel.fromJson(json);
}

/// @nodoc
mixin _$OtpRequestModel {
  @JsonKey(name: 'phoneNumber')
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this OtpRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpRequestModelCopyWith<OtpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpRequestModelCopyWith<$Res> {
  factory $OtpRequestModelCopyWith(
          OtpRequestModel value, $Res Function(OtpRequestModel) then) =
      _$OtpRequestModelCopyWithImpl<$Res, OtpRequestModel>;
  @useResult
  $Res call({@JsonKey(name: 'phoneNumber') String phoneNumber});
}

/// @nodoc
class _$OtpRequestModelCopyWithImpl<$Res, $Val extends OtpRequestModel>
    implements $OtpRequestModelCopyWith<$Res> {
  _$OtpRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpRequestModelImplCopyWith<$Res>
    implements $OtpRequestModelCopyWith<$Res> {
  factory _$$OtpRequestModelImplCopyWith(_$OtpRequestModelImpl value,
          $Res Function(_$OtpRequestModelImpl) then) =
      __$$OtpRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'phoneNumber') String phoneNumber});
}

/// @nodoc
class __$$OtpRequestModelImplCopyWithImpl<$Res>
    extends _$OtpRequestModelCopyWithImpl<$Res, _$OtpRequestModelImpl>
    implements _$$OtpRequestModelImplCopyWith<$Res> {
  __$$OtpRequestModelImplCopyWithImpl(
      _$OtpRequestModelImpl _value, $Res Function(_$OtpRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$OtpRequestModelImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtpRequestModelImpl implements _OtpRequestModel {
  const _$OtpRequestModelImpl(
      {@JsonKey(name: 'phoneNumber') required this.phoneNumber});

  factory _$OtpRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;

  @override
  String toString() {
    return 'OtpRequestModel(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpRequestModelImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of OtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpRequestModelImplCopyWith<_$OtpRequestModelImpl> get copyWith =>
      __$$OtpRequestModelImplCopyWithImpl<_$OtpRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpRequestModelImplToJson(
      this,
    );
  }
}

abstract class _OtpRequestModel implements OtpRequestModel {
  const factory _OtpRequestModel(
          {@JsonKey(name: 'phoneNumber') required final String phoneNumber}) =
      _$OtpRequestModelImpl;

  factory _OtpRequestModel.fromJson(Map<String, dynamic> json) =
      _$OtpRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'phoneNumber')
  String get phoneNumber;

  /// Create a copy of OtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpRequestModelImplCopyWith<_$OtpRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerifyOtpRequestModel _$VerifyOtpRequestModelFromJson(
    Map<String, dynamic> json) {
  return _VerifyOtpRequestModel.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpRequestModel {
  @JsonKey(name: 'phoneNumber')
  String get phoneNumber => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  /// Serializes this VerifyOtpRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyOtpRequestModelCopyWith<VerifyOtpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpRequestModelCopyWith<$Res> {
  factory $VerifyOtpRequestModelCopyWith(VerifyOtpRequestModel value,
          $Res Function(VerifyOtpRequestModel) then) =
      _$VerifyOtpRequestModelCopyWithImpl<$Res, VerifyOtpRequestModel>;
  @useResult
  $Res call({@JsonKey(name: 'phoneNumber') String phoneNumber, String otp});
}

/// @nodoc
class _$VerifyOtpRequestModelCopyWithImpl<$Res,
        $Val extends VerifyOtpRequestModel>
    implements $VerifyOtpRequestModelCopyWith<$Res> {
  _$VerifyOtpRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? otp = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOtpRequestModelImplCopyWith<$Res>
    implements $VerifyOtpRequestModelCopyWith<$Res> {
  factory _$$VerifyOtpRequestModelImplCopyWith(
          _$VerifyOtpRequestModelImpl value,
          $Res Function(_$VerifyOtpRequestModelImpl) then) =
      __$$VerifyOtpRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'phoneNumber') String phoneNumber, String otp});
}

/// @nodoc
class __$$VerifyOtpRequestModelImplCopyWithImpl<$Res>
    extends _$VerifyOtpRequestModelCopyWithImpl<$Res,
        _$VerifyOtpRequestModelImpl>
    implements _$$VerifyOtpRequestModelImplCopyWith<$Res> {
  __$$VerifyOtpRequestModelImplCopyWithImpl(_$VerifyOtpRequestModelImpl _value,
      $Res Function(_$VerifyOtpRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? otp = null,
  }) {
    return _then(_$VerifyOtpRequestModelImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpRequestModelImpl implements _VerifyOtpRequestModel {
  const _$VerifyOtpRequestModelImpl(
      {@JsonKey(name: 'phoneNumber') required this.phoneNumber,
      required this.otp});

  factory _$VerifyOtpRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;
  @override
  final String otp;

  @override
  String toString() {
    return 'VerifyOtpRequestModel(phoneNumber: $phoneNumber, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpRequestModelImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, otp);

  /// Create a copy of VerifyOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpRequestModelImplCopyWith<_$VerifyOtpRequestModelImpl>
      get copyWith => __$$VerifyOtpRequestModelImplCopyWithImpl<
          _$VerifyOtpRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpRequestModelImplToJson(
      this,
    );
  }
}

abstract class _VerifyOtpRequestModel implements VerifyOtpRequestModel {
  const factory _VerifyOtpRequestModel(
      {@JsonKey(name: 'phoneNumber') required final String phoneNumber,
      required final String otp}) = _$VerifyOtpRequestModelImpl;

  factory _VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'phoneNumber')
  String get phoneNumber;
  @override
  String get otp;

  /// Create a copy of VerifyOtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpRequestModelImplCopyWith<_$VerifyOtpRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
