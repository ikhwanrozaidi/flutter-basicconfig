import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../repositories/auth_repositories.dart';

@lazySingleton
class LogoutUseCase implements UseCaseNoParams<void> {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.logout();
  }
}
