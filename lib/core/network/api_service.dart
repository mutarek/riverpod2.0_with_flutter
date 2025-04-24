import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'custom_interceptor.dart';

class ApiService {
  final Dio dio;

  ApiService._internal(this.dio);


  factory ApiService() {
    return ApiService._internal(createDio());
  }


  static Dio createDioWithBaseUrl() {
    return Dio(BaseOptions());
  }


  static Dio createDio() {
    var dio = createDioWithBaseUrl();

    if (kDebugMode) {
      dio.interceptors.add(
        CustomInterceptor(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 1000,
        ),
      );
    }

    return dio;
  }
}