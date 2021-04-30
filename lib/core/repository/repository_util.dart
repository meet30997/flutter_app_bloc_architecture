import 'package:dartz/dartz.dart';
import 'package:flutter_app_bloc_architecure/core/error/exceptions.dart';
import 'package:flutter_app_bloc_architecure/core/error/failures.dart';
import 'package:flutter_app_bloc_architecure/core/platform/network_info.dart';

Future<Either<Failure, Type>> repositoryImplUtil<Type>(
    NetworkInfo networkInfo, Future<Type> data) async {
  if (await networkInfo.isConnected) {
    try {
      final remoteFacts = await data;
      return Right(remoteFacts);
    } on ServerException {
      return Left(ServerFailure());
    }
  } else {
    return Left(NetworkFailure());
  }
}
