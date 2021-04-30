import 'package:dio/dio.dart';
import 'package:flutter_app_bloc_architecure/core/platform/dio_interceptor.dart';

Dio dioClient() {
  var dio = Dio(BaseOptions(
    baseUrl: "https://cat-fact.herokuapp.com/",
    connectTimeout: 20000,
    receiveTimeout: 20000,
  ));
  dio.interceptors.add(DioInterceptor());
  return dio;
}
