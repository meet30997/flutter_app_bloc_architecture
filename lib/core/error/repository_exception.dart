import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

// General Failures
class RepositoryException extends Equatable {
  final String message;

  RepositoryException({@required this.message});

  @override
  List<Object> get props => [message];
}
