import 'package:dio/dio.dart';

import 'dio_interceptor.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      // baseUrl: 'https://reqres.in/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )..interceptors.add(DioErrorInterceptor());
}