import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../../../../core/utils/validators.dart';
import '../repositories/auth_repositories.dart';

@lazySingleton
class RequestOtpUseCase implements UseCase<String, RequestOtpParams> {
  final AuthRepository repository;

  RequestOtpUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(RequestOtpParams params) async {
    // Validate phone number
    final validation = Validators.phoneNumber(params.phoneNumber);
    if (validation != null) {
      return Left(ValidationFailure(validation));
    }

    return await repository.requestOtp(params.phoneNumber);
  }
}

class RequestOtpParams extends Equatable {
  final String phoneNumber;

  const RequestOtpParams(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}
