import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_app_bloc_architecure/core/platform/dio_client.dart';
import 'package:flutter_app_bloc_architecure/core/platform/network_info.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/data/datasources/cat_facts_remote_data_source_contract.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/data/datasources/cat_facts_remote_data_source_impl.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/data/repositories/cat_facts_repository_impl.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/domain/repositories/cat_facts_repository_contract.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/domain/usecases/get_cat_facts_usecase.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/presentation/bloc/cat_facts_bloc.dart';
import 'package:get_it/get_it.dart';

final gt = GetIt.instance;

void init() {
  //Features Cat Facts
  gt.registerFactory(() => CatFactsBloc(getCatFactsUseCase: gt()));

  //Use Cases
  gt.registerLazySingleton(
      () => GetCatFactsUseCase(catFactsRepositoryContract: gt()));

  // Repository
  gt.registerLazySingleton<CatFactsRepositoryContract>(
      () => CatFactsRepositoryImpl(remoteDataSource: gt(), networkInfo: gt()));

  // Data Source
  gt.registerLazySingleton<CatFactsRemoteDataSourceContract>(
      () => CatFactsRemoteDataSourceImpl(dioClient: gt()));

  //Core Module
  gt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(gt()));

  //External
  gt.registerLazySingleton(() => DataConnectionChecker());
  gt.registerLazySingleton(() => dioClient());
}
