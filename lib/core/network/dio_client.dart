import 'package:acl_flutter/core/network/api_config.dart';
import 'package:acl_flutter/core/network/dio_interceptor.dart';
import 'package:dio/dio.dart' show Dio, ResponseType;

import '../../common/configurations/configurations.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio
      ..options.baseUrl = Configurations.host
      ..options.baseUrl = Configurations.host
      ..options.headers = ApiConfig.header
      ..options.connectTimeout = ApiConfig.connectionTimeout
      ..options.receiveTimeout = ApiConfig.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.addAll([DioInterceptor(dio)]);
  }
}
