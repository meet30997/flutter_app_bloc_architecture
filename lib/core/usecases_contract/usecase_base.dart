import 'package:dartz/dartz.dart';
import 'package:flutter_app_bloc_architecure/core/error/repository_exception.dart';

abstract class UseCaseBaseContract<Type> {
  Future<Either<RepositoryException, Type>> call();
}
