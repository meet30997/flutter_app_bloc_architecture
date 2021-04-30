import 'package:dartz/dartz.dart';
import 'package:flutter_app_bloc_architecure/core/error/data_source_exceptions.dart';
import 'package:flutter_app_bloc_architecure/core/error/repository_exception.dart';
import 'package:flutter_app_bloc_architecure/core/platform/network_info.dart';

const String NETWORK_FAILURE_MESSAGE =
    'Please make sure that you are connected to the internet';

Future<Either<RepositoryException, Type>> repositoryImplUtil<Type>(
    NetworkInfo networkInfo, Future<Type> dataFromDataSource) async {
  if (await networkInfo.isConnected) {
    try {
      final remoteFacts = await dataFromDataSource;
      return Right(remoteFacts);
    } on DataSourceException catch (e) {
      return Left(RepositoryException(message: e.message));
    }
  } else {
    return Left(RepositoryException(message: NETWORK_FAILURE_MESSAGE));
  }
}
