import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../../../../core/utils/validators.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repositories.dart';

@lazySingleton
class VerifyOtpUseCase implements UseCase<UserEntity, VerifyOtpParams> {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(VerifyOtpParams params) async {
    // Validate phone number
    final phoneValidation = Validators.phoneNumber(params.phoneNumber);
    if (phoneValidation != null) {
      return Left(ValidationFailure(phoneValidation));
    }

    // Validate OTP
    final otpValidation = Validators.otp(params.otp);
    if (otpValidation != null) {
      return Left(ValidationFailure(otpValidation));
    }

    return await repository.verifyOtp(params.phoneNumber, params.otp);
  }
}

class VerifyOtpParams extends Equatable {
  final String phoneNumber;
  final String otp;

  const VerifyOtpParams({required this.phoneNumber, required this.otp});

  @override
  List<Object> get props => [phoneNumber, otp];
}
