// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String phoneNumber) requestOtp,
    required TResult Function(String phoneNumber, String otp) verifyOtp,
    required TResult Function(String email, String password) login,
    required TResult Function() logout,
    required TResult Function() clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String phoneNumber)? requestOtp,
    TResult? Function(String phoneNumber, String otp)? verifyOtp,
    TResult? Function(String email, String password)? login,
    TResult? Function()? logout,
    TResult? Function()? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String phoneNumber)? requestOtp,
    TResult Function(String phoneNumber, String otp)? verifyOtp,
    TResult Function(String email, String password)? login,
    TResult Function()? logout,
    TResult Function()? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(RequestOtp value) requestOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(Login value) login,
    required TResult Function(Logout value) logout,
    required TResult Function(ClearError value) clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(RequestOtp value)? requestOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(Login value)? login,
    TResult? Function(Logout value)? logout,
    TResult? Function(ClearError value)? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(RequestOtp value)? requestOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(Login value)? login,
    TResult Function(Logout value)? logout,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckAuthStatusImplCopyWith<$Res> {
  factory _$$CheckAuthStatusImplCopyWith(_$CheckAuthStatusImpl value,
          $Res Function(_$CheckAuthStatusImpl) then) =
      __$$CheckAuthStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthStatusImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckAuthStatusImpl>
    implements _$$CheckAuthStatusImplCopyWith<$Res> {
  __$$CheckAuthStatusImplCopyWithImpl(
      _$CheckAuthStatusImpl _value, $Res Function(_$CheckAuthStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckAuthStatusImpl implements CheckAuthStatus {
  const _$CheckAuthStatusImpl();

  @override
  String toString() {
    return 'AuthEvent.checkAuthStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAuthStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String phoneNumber) requestOtp,
    required TResult Function(String phoneNumber, String otp) verifyOtp,
    required TResult Function(String email, String password) login,
    required TResult Function() logout,
    required TResult Function() clearError,
  }) {
    return checkAuthStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String phoneNumber)? requestOtp,
    TResult? Function(String phoneNumber, String otp)? verifyOtp,
    TResult? Function(String email, String password)? login,
    TResult? Function()? logout,
    TResult? Function()? clearError,
  }) {
    return checkAuthStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String phoneNumber)? requestOtp,
    TResult Function(String phoneNumber, String otp)? verifyOtp,
    TResult Function(String email, String password)? login,
    TResult Function()? logout,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(RequestOtp value) requestOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(Login value) login,
    required TResult Function(Logout value) logout,
    required TResult Function(ClearError value) clearError,
  }) {
    return checkAuthStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(RequestOtp value)? requestOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(Login value)? login,
    TResult? Function(Logout value)? logout,
    TResult? Function(ClearError value)? clearError,
  }) {
    return checkAuthStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(RequestOtp value)? requestOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(Login value)? login,
    TResult Function(Logout value)? logout,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus(this);
    }
    return orElse();
  }
}

abstract class CheckAuthStatus implements AuthEvent {
  const factory CheckAuthStatus() = _$CheckAuthStatusImpl;
}

/// @nodoc
abstract class _$$RequestOtpImplCopyWith<$Res> {
  factory _$$RequestOtpImplCopyWith(
          _$RequestOtpImpl value, $Res Function(_$RequestOtpImpl) then) =
      __$$RequestOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$RequestOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RequestOtpImpl>
    implements _$$RequestOtpImplCopyWith<$Res> {
  __$$RequestOtpImplCopyWithImpl(
      _$RequestOtpImpl _value, $Res Function(_$RequestOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$RequestOtpImpl(
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RequestOtpImpl implements RequestOtp {
  const _$RequestOtpImpl(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthEvent.requestOtp(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOtpImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOtpImplCopyWith<_$RequestOtpImpl> get copyWith =>
      __$$RequestOtpImplCopyWithImpl<_$RequestOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String phoneNumber) requestOtp,
    required TResult Function(String phoneNumber, String otp) verifyOtp,
    required TResult Function(String email, String password) login,
    required TResult Function() logout,
    required TResult Function() clearError,
  }) {
    return requestOtp(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String phoneNumber)? requestOtp,
    TResult? Function(String phoneNumber, String otp)? verifyOtp,
    TResult? Function(String email, String password)? login,
    TResult? Function()? logout,
    TResult? Function()? clearError,
  }) {
    return requestOtp?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String phoneNumber)? requestOtp,
    TResult Function(String phoneNumber, String otp)? verifyOtp,
    TResult Function(String email, String password)? login,
    TResult Function()? logout,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (requestOtp != null) {
      return requestOtp(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(RequestOtp value) requestOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(Login value) login,
    required TResult Function(Logout value) logout,
    required TResult Function(ClearError value) clearError,
  }) {
    return requestOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(RequestOtp value)? requestOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(Login value)? login,
    TResult? Function(Logout value)? logout,
    TResult? Function(ClearError value)? clearError,
  }) {
    return requestOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(RequestOtp value)? requestOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(Login value)? login,
    TResult Function(Logout value)? logout,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (requestOtp != null) {
      return requestOtp(this);
    }
    return orElse();
  }
}

abstract class RequestOtp implements AuthEvent {
  const factory RequestOtp(final String phoneNumber) = _$RequestOtpImpl;

  String get phoneNumber;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestOtpImplCopyWith<_$RequestOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOtpImplCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
          _$VerifyOtpImpl value, $Res Function(_$VerifyOtpImpl) then) =
      __$$VerifyOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, String otp});
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
      _$VerifyOtpImpl _value, $Res Function(_$VerifyOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? otp = null,
  }) {
    return _then(_$VerifyOtpImpl(
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

class _$VerifyOtpImpl implements VerifyOtp {
  const _$VerifyOtpImpl({required this.phoneNumber, required this.otp});

  @override
  final String phoneNumber;
  @override
  final String otp;

  @override
  String toString() {
    return 'AuthEvent.verifyOtp(phoneNumber: $phoneNumber, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, otp);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      __$$VerifyOtpImplCopyWithImpl<_$VerifyOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String phoneNumber) requestOtp,
    required TResult Function(String phoneNumber, String otp) verifyOtp,
    required TResult Function(String email, String password) login,
    required TResult Function() logout,
    required TResult Function() clearError,
  }) {
    return verifyOtp(phoneNumber, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String phoneNumber)? requestOtp,
    TResult? Function(String phoneNumber, String otp)? verifyOtp,
    TResult? Function(String email, String password)? login,
    TResult? Function()? logout,
    TResult? Function()? clearError,
  }) {
    return verifyOtp?.call(phoneNumber, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String phoneNumber)? requestOtp,
    TResult Function(String phoneNumber, String otp)? verifyOtp,
    TResult Function(String email, String password)? login,
    TResult Function()? logout,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(phoneNumber, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(RequestOtp value) requestOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(Login value) login,
    required TResult Function(Logout value) logout,
    required TResult Function(ClearError value) clearError,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(RequestOtp value)? requestOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(Login value)? login,
    TResult? Function(Logout value)? logout,
    TResult? Function(ClearError value)? clearError,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(RequestOtp value)? requestOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(Login value)? login,
    TResult Function(Logout value)? logout,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class VerifyOtp implements AuthEvent {
  const factory VerifyOtp(
      {required final String phoneNumber,
      required final String otp}) = _$VerifyOtpImpl;

  String get phoneNumber;
  String get otp;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginImpl(
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

class _$LoginImpl implements Login {
  const _$LoginImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.login(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String phoneNumber) requestOtp,
    required TResult Function(String phoneNumber, String otp) verifyOtp,
    required TResult Function(String email, String password) login,
    required TResult Function() logout,
    required TResult Function() clearError,
  }) {
    return login(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String phoneNumber)? requestOtp,
    TResult? Function(String phoneNumber, String otp)? verifyOtp,
    TResult? Function(String email, String password)? login,
    TResult? Function()? logout,
    TResult? Function()? clearError,
  }) {
    return login?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String phoneNumber)? requestOtp,
    TResult Function(String phoneNumber, String otp)? verifyOtp,
    TResult Function(String email, String password)? login,
    TResult Function()? logout,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(RequestOtp value) requestOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(Login value) login,
    required TResult Function(Logout value) logout,
    required TResult Function(ClearError value) clearError,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(RequestOtp value)? requestOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(Login value)? login,
    TResult? Function(Logout value)? logout,
    TResult? Function(ClearError value)? clearError,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(RequestOtp value)? requestOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(Login value)? login,
    TResult Function(Logout value)? logout,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class Login implements AuthEvent {
  const factory Login(
      {required final String email,
      required final String password}) = _$LoginImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String phoneNumber) requestOtp,
    required TResult Function(String phoneNumber, String otp) verifyOtp,
    required TResult Function(String email, String password) login,
    required TResult Function() logout,
    required TResult Function() clearError,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String phoneNumber)? requestOtp,
    TResult? Function(String phoneNumber, String otp)? verifyOtp,
    TResult? Function(String email, String password)? login,
    TResult? Function()? logout,
    TResult? Function()? clearError,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String phoneNumber)? requestOtp,
    TResult Function(String phoneNumber, String otp)? verifyOtp,
    TResult Function(String email, String password)? login,
    TResult Function()? logout,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(RequestOtp value) requestOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(Login value) login,
    required TResult Function(Logout value) logout,
    required TResult Function(ClearError value) clearError,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(RequestOtp value)? requestOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(Login value)? login,
    TResult? Function(Logout value)? logout,
    TResult? Function(ClearError value)? clearError,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(RequestOtp value)? requestOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(Login value)? login,
    TResult Function(Logout value)? logout,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class Logout implements AuthEvent {
  const factory Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$ClearErrorImplCopyWith<$Res> {
  factory _$$ClearErrorImplCopyWith(
          _$ClearErrorImpl value, $Res Function(_$ClearErrorImpl) then) =
      __$$ClearErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearErrorImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ClearErrorImpl>
    implements _$$ClearErrorImplCopyWith<$Res> {
  __$$ClearErrorImplCopyWithImpl(
      _$ClearErrorImpl _value, $Res Function(_$ClearErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearErrorImpl implements ClearError {
  const _$ClearErrorImpl();

  @override
  String toString() {
    return 'AuthEvent.clearError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String phoneNumber) requestOtp,
    required TResult Function(String phoneNumber, String otp) verifyOtp,
    required TResult Function(String email, String password) login,
    required TResult Function() logout,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String phoneNumber)? requestOtp,
    TResult? Function(String phoneNumber, String otp)? verifyOtp,
    TResult? Function(String email, String password)? login,
    TResult? Function()? logout,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String phoneNumber)? requestOtp,
    TResult Function(String phoneNumber, String otp)? verifyOtp,
    TResult Function(String email, String password)? login,
    TResult Function()? logout,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(RequestOtp value) requestOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(Login value) login,
    required TResult Function(Logout value) logout,
    required TResult Function(ClearError value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(RequestOtp value)? requestOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(Login value)? login,
    TResult? Function(Logout value)? logout,
    TResult? Function(ClearError value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(RequestOtp value)? requestOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(Login value)? login,
    TResult Function(Logout value)? logout,
    TResult Function(ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class ClearError implements AuthEvent {
  const factory ClearError() = _$ClearErrorImpl;
}
