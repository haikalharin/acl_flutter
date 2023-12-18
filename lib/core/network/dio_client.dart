import 'package:acl_flutter/core/network/api_config.dart';
import 'package:acl_flutter/core/network/dio_interceptor.dart';
import 'package:dio/dio.dart' show Dio, ResponseType;
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:flutter/foundation.dart';

import '../../common/configurations/configurations.dart';
import 'auth_interceptor.dart';

class DioClient {
  final Dio dio;
  final Dio dioAuth;

  DioClient(this.dio, this.dioAuth) {
    if (!kReleaseMode) {
      dio
        ..options.baseUrl = Configurations.host
        ..options.baseUrl = Configurations.host
        ..options.headers = ApiConfig.header
        ..options.connectTimeout = ApiConfig.connectionTimeout
        ..options.receiveTimeout = ApiConfig.receiveTimeout
        ..options.responseType = ResponseType.json
        ..interceptors.addAll([
          DioInterceptor(dio),
          CurlLoggerDioInterceptor(printOnSuccess: true)
        ]);
    } else{
      dio
        ..options.baseUrl = Configurations.host
        ..options.baseUrl = Configurations.host
        ..options.headers = ApiConfig.header
        ..options.connectTimeout = ApiConfig.connectionTimeout
        ..options.receiveTimeout = ApiConfig.receiveTimeout
        ..options.responseType = ResponseType.json
        ..interceptors.addAll([
          DioInterceptor(dio)
        ]);
    }
    if (!kReleaseMode) {
      dioAuth
        ..options.baseUrl = Configurations.host
        ..options.baseUrl = Configurations.host
        ..options.headers = ApiConfig.header
        ..options.connectTimeout = ApiConfig.connectionTimeout
        ..options.receiveTimeout = ApiConfig.receiveTimeout
        ..options.responseType = ResponseType.json
        ..interceptors.addAll([
          AuthInterceptor(dio),
          CurlLoggerDioInterceptor(printOnSuccess: true)
        ]);
    }else{
      dioAuth
        ..options.baseUrl = Configurations.host
        ..options.baseUrl = Configurations.host
        ..options.headers = ApiConfig.header
        ..options.connectTimeout = ApiConfig.connectionTimeout
        ..options.receiveTimeout = ApiConfig.receiveTimeout
        ..options.responseType = ResponseType.json
        ..interceptors.addAll([
          AuthInterceptor(dio)
        ]);
    }
  }
}
