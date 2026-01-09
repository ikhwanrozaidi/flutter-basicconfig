// lib/core/utils/usecase.dart

import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Base class for all use cases
/// Use cases encapsulate business logic and are called by BLoCs
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use case with no parameters
abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}

/// Use case with stream return type
abstract class StreamUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}
