import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/network/api_response.dart';
import '../../../../core/constant/api_constant.dart';
import '../models/auth_response_model.dart';
import '../models/login_request_model.dart';
import '../models/logout_response_model.dart';
import '../models/otp_response_model.dart';
import '../models/user_model.dart';

part 'auth_api_service.g.dart';

@injectable
@RestApi()
abstract class AuthApiService {
  @factoryMethod
  factory AuthApiService(Dio dio) = _AuthApiService;

  /// Request OTP
  @POST(ApiConstants.requestOtp)
  Future<ApiResponse<OtpResponseModel>> requestOtp(
    @Body() OtpRequestModel request,
  );

  /// Verify OTP and login
  @POST(ApiConstants.verifyOtp)
  Future<ApiResponse<AuthResponseModel>> verifyOtp(
    @Body() VerifyOtpRequestModel request,
  );

  /// Login with email and password
  @POST(ApiConstants.login)
  Future<ApiResponse<AuthResponseModel>> login(
    @Body() LoginRequestModel request,
  );

  /// Logout
  @POST(ApiConstants.logout)
  Future<ApiResponse<LogoutResponseModel>> logout();

  /// Get current user profile
  @GET(ApiConstants.profile)
  Future<ApiResponse<UserModel>> getProfile();
}
