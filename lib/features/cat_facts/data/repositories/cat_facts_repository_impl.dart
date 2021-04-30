import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_bloc_architecure/core/error/repository_exception.dart';
import 'package:flutter_app_bloc_architecure/core/platform/network_info.dart';
import 'package:flutter_app_bloc_architecure/core/repository/repository_util.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/data/datasources/cat_facts_remote_data_source_contract.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/domain/entities/cat_facts_entity.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/domain/repositories/cat_facts_repository_contract.dart';

class CatFactsRepositoryImpl implements CatFactsRepositoryContract {
  final CatFactsRemoteDataSourceContract remoteDataSource;
  final NetworkInfo networkInfo;

  CatFactsRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});

  @override
  Future<Either<RepositoryException, List<CatFactsEntity>>>
      getCatFacts() async {
    return repositoryImplUtil<List<CatFactsEntity>>(
        networkInfo, remoteDataSource.getCatFacts());
  }
}
