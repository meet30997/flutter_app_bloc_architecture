import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_app_bloc_architecure/core/error/exceptions.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/data/datasources/cat_facts_remote_data_source_contract.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/data/models/cat_facts_modal.dart';
import 'package:http/http.dart' as http;

class CatFactsRemoteDataSourceImpl implements CatFactsRemoteDataSourceContract {
  final http.Client client;

  CatFactsRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<CatFactsModal>> getCatFacts() async {
    final response = await client.get(
      Uri.parse("https://cat-fact.herokuapp.com/facts"),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      if (data == null) throw ServerException();
      List<CatFactsModal> list =
          data.map((e) => CatFactsModal.fromJson(e)).toList();
      return list;
    } else {
      throw ServerException();
    }
  }
}
