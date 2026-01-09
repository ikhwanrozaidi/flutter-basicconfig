import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repositories.dart';

@lazySingleton
class CheckAuthStatusUseCase implements UseCaseNoParams<UserEntity?> {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity?>> call() async {
    // Check if authenticated
    final isAuthResult = await repository.isAuthenticated();

    return await isAuthResult.fold((failure) => Left(failure), (isAuth) async {
      if (!isAuth) {
        return const Right(null);
      }

      // Get current user
      return await repository.getCurrentUser();
    });
  }
}
