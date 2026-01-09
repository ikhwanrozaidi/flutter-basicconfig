import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/check_auth_status_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/request_otp_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthStatusUseCase checkAuthStatusUseCase;
  final RequestOtpUseCase requestOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc(
    this.checkAuthStatusUseCase,
    this.requestOtpUseCase,
    this.verifyOtpUseCase,
    this.loginUseCase,
    this.logoutUseCase,
  ) : super(const AuthState.initial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<RequestOtp>(_onRequestOtp);
    on<VerifyOtp>(_onVerifyOtp);
    on<Login>(_onLogin);
    on<Logout>(_onLogout);
    on<ClearError>(_onClearError);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await checkAuthStatusUseCase();

    result.fold(
      (failure) {
        print('❌ Auth check failed: ${failure.message}');
        emit(const AuthState.unauthenticated());
      },
      (user) {
        if (user != null) {
          print('✅ User authenticated: ${user.email}');
          emit(AuthState.authenticated(user));
        } else {
          print('📭 No authenticated user');
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  Future<void> _onRequestOtp(RequestOtp event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await requestOtpUseCase(RequestOtpParams(event.phoneNumber));

    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (message) => emit(
        AuthState.otpSent(phoneNumber: event.phoneNumber, message: message),
      ),
    );
  }

  Future<void> _onVerifyOtp(VerifyOtp event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await verifyOtpUseCase(
      VerifyOtpParams(phoneNumber: event.phoneNumber, otp: event.otp),
    );

    result.fold((failure) => emit(AuthState.error(failure.message)), (user) {
      print('✅ OTP verified, user logged in: ${user.email}');
      emit(AuthState.authenticated(user));
    });
  }

  Future<void> _onLogin(Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );

    result.fold((failure) => emit(AuthState.error(failure.message)), (user) {
      print('✅ User logged in: ${user.email}');
      emit(AuthState.authenticated(user));
    });
  }

  Future<void> _onLogout(Logout event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await logoutUseCase();

    result.fold((failure) => emit(AuthState.error(failure.message)), (_) {
      print('✅ User logged out');
      emit(const AuthState.unauthenticated());
    });
  }

  void _onClearError(ClearError event, Emitter<AuthState> emit) {
    emit(const AuthState.initial());
  }
}
