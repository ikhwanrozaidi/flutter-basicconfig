// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasource/auth_api_service.dart' as _i372;
import '../../features/auth/data/datasource/auth_local_datasource.dart'
    as _i600;
import '../../features/auth/data/datasource/auth_remote_datasource.dart'
    as _i175;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repositories.dart'
    as _i962;
import '../../features/auth/domain/usecases/check_auth_status_usecase.dart'
    as _i52;
import '../../features/auth/domain/usecases/clear_auth_cache_usecase.dart'
    as _i871;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/request_otp_usecase.dart' as _i29;
import '../../features/auth/domain/usecases/verify_otp_usecase.dart' as _i503;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../database/app_database.dart' as _i982;
import '../network/connectivity_service.dart' as _i491;
import '../network/dio_client.dart' as _i667;
import '../network/error_interceptor.dart' as _i1004;
import '../network/network_info.dart' as _i932;
import '../service/secure_storage_service.dart' as _i142;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i491.ConnectivityService>(() => _i491.ConnectivityService());
    gh.singleton<_i982.DatabaseService>(() => _i982.DatabaseService());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i1004.ErrorInterceptor>(() => _i1004.ErrorInterceptor());
    gh.factory<_i372.AuthApiService>(
        () => _i372.AuthApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i491.NetworkInfo>(
        () => _i491.EnhancedNetworkInfo(gh<_i491.ConnectivityService>()));
    gh.lazySingleton<_i600.AuthLocalDataSource>(
        () => _i600.AuthLocalDataSourceImpl(gh<_i982.DatabaseService>()));
    gh.lazySingleton<_i142.SecureStorageService>(
        () => _i142.SecureStorageService(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i932.NetworkInfo>(
        () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()));
    gh.factoryParam<_i667.DioClient, bool?, dynamic>((
      useMockData,
      _,
    ) =>
        _i667.DioClient(
          gh<_i361.Dio>(),
          gh<_i142.SecureStorageService>(),
          useMockData: useMockData,
        ));
    gh.lazySingleton<_i175.AuthRemoteDataSource>(
        () => _i175.AuthRemoteDataSourceImpl(gh<_i372.AuthApiService>()));
    gh.lazySingleton<_i962.AuthRepository>(() => _i153.AuthRepositoryImpl(
          gh<_i175.AuthRemoteDataSource>(),
          gh<_i600.AuthLocalDataSource>(),
          gh<_i142.SecureStorageService>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i871.ClearAuthCacheUseCase>(
        () => _i871.ClearAuthCacheUseCase(gh<_i962.AuthRepository>()));
    gh.lazySingleton<_i188.LoginUseCase>(
        () => _i188.LoginUseCase(gh<_i962.AuthRepository>()));
    gh.lazySingleton<_i48.LogoutUseCase>(
        () => _i48.LogoutUseCase(gh<_i962.AuthRepository>()));
    gh.lazySingleton<_i29.RequestOtpUseCase>(
        () => _i29.RequestOtpUseCase(gh<_i962.AuthRepository>()));
    gh.lazySingleton<_i52.CheckAuthStatusUseCase>(
        () => _i52.CheckAuthStatusUseCase(gh<_i962.AuthRepository>()));
    gh.lazySingleton<_i503.VerifyOtpUseCase>(
        () => _i503.VerifyOtpUseCase(gh<_i962.AuthRepository>()));
    gh.factory<_i797.AuthBloc>(() => _i797.AuthBloc(
          gh<_i52.CheckAuthStatusUseCase>(),
          gh<_i29.RequestOtpUseCase>(),
          gh<_i503.VerifyOtpUseCase>(),
          gh<_i188.LoginUseCase>(),
          gh<_i48.LogoutUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
