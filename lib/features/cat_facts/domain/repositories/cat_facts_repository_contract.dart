import 'package:dartz/dartz.dart';
import 'package:flutter_app_bloc_architecure/core/error/repository_exception.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/domain/entities/cat_facts_entity.dart';

abstract class CatFactsRepositoryContract {
  Future<Either<RepositoryException, List<CatFactsEntity>>> getCatFacts();
}
