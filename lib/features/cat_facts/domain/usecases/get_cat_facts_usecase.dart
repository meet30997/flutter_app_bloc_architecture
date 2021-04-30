import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_bloc_architecure/core/error/failures.dart';
import 'package:flutter_app_bloc_architecure/core/usecases_contract/usecase_base.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/domain/entities/cat_facts_entity.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/domain/repositories/cat_facts_repository_contract.dart';

class GetCatFactsUseCase implements UseCaseBaseContract<List<CatFactsEntity>> {
  final CatFactsRepositoryContract catFactsRepositoryContract;

  GetCatFactsUseCase({@required this.catFactsRepositoryContract});

  @override
  Future<Either<Failure, List<CatFactsEntity>>> call() async {
    return await catFactsRepositoryContract.getCatFacts();
  }
}
