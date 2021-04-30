import 'package:flutter/material.dart';

class DataSourceException implements Exception {
  final String message;

  DataSourceException({@required this.message});
}
