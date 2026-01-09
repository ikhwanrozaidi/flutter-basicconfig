import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../../../../core/utils/validators.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repositories.dart';

@lazySingleton
class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    // Validate email
    final emailValidation = Validators.email(params.email);
    if (emailValidation != null) {
      return Left(ValidationFailure(emailValidation));
    }

    // Validate password
    final passwordValidation = Validators.required(
      params.password,
      fieldName: 'Password',
    );
    if (passwordValidation != null) {
      return Left(ValidationFailure(passwordValidation));
    }

    return await repository.login(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
