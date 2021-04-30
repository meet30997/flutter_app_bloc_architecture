// Bloc State
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/domain/entities/cat_facts_entity.dart';

abstract class GetCatFactsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends GetCatFactsState {}

class Loading extends GetCatFactsState {}

class Loaded extends GetCatFactsState {
  final List<CatFactsEntity> catFacts;

  Loaded({@required this.catFacts});

  @override
  List<Object> get props => [catFacts];
}

class Error extends GetCatFactsState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
