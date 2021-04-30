import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_bloc_architecure/core/error/exceptions.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/data/datasources/cat_facts_remote_data_source_contract.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/data/models/cat_facts_modal.dart';

class CatFactsRemoteDataSourceImpl implements CatFactsRemoteDataSourceContract {
  final Dio dioClient;

  CatFactsRemoteDataSourceImpl({@required this.dioClient});

  @override
  Future<List<CatFactsModal>> getCatFacts() async {
    try {
      final response = await dioClient.get("facts");
      if (response.statusCode == 200) {
        var data = response.data as List;
        if (data == null) throw ServerException();
        List<CatFactsModal> list =
            data.map((e) => CatFactsModal.fromJson(e)).toList();
        return list;
      } else {
        throw ServerException();
      }
    } on DioError catch (e) {
      throw ServerException();
    }
  }
}
