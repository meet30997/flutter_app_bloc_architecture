import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class CatFactsEntity extends Equatable {
  final String text;
  final String createdAt;

  CatFactsEntity({@required this.text, @required this.createdAt});

  @override
  List<Object> get props => [text, createdAt];
}
