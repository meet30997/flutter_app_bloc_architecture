import 'package:flutter_app_bloc_architecure/features/cat_facts/data/models/cat_facts_modal.dart';

abstract class CatFactsRemoteDataSourceContract {
  Future<List<CatFactsModal>> getCatFacts();
}
