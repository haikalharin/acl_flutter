import 'package:acl_flutter/core/network/api_config.dart';
import 'package:acl_flutter/core/network/dio_interceptor.dart';
import 'package:dio/dio.dart' show Dio, ResponseType;

import '../../common/configurations/configurations.dart';
import 'auth_interceptor.dart';

class DioClient {
  final Dio dio;
  final Dio dioAuth;

  DioClient(this.dio, this.dioAuth) {
    dio
      ..options.baseUrl = Configurations.host
      ..options.baseUrl = Configurations.host
      ..options.headers = ApiConfig.header
      ..options.connectTimeout = ApiConfig.connectionTimeout
      ..options.receiveTimeout = ApiConfig.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.addAll([DioInterceptor(dio)]);

    dioAuth
      ..options.baseUrl = Configurations.host
      ..options.baseUrl = Configurations.host
      ..options.headers = ApiConfig.header
      ..options.connectTimeout = ApiConfig.connectionTimeout
      ..options.receiveTimeout = ApiConfig.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.addAll([AuthInterceptor(dio)]);
  }
}
