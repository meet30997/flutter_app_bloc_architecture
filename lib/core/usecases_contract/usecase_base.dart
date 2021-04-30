import 'package:dartz/dartz.dart';
import 'package:flutter_app_bloc_architecure/core/error/failures.dart';

abstract class UseCaseBaseContract<Type> {
  Future<Either<Failure, Type>> call();
}
