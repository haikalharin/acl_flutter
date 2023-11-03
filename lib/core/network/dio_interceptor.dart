// ignore_for_file: deprecated_member_use

import 'package:acl_flutter/common/app_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;

  DioInterceptor(this.dio);
  final storage = const FlutterSecureStorage();

  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      printTime: false,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    logger.i('====================START====================');
    logger.i('HTTP method => ${options.method} ');
    logger.i('Request => ${options.baseUrl}${options.path}${options.queryParameters.format}');
    logger.i('Header  => ${options.headers}');
    logger.i('Body  => ${options.data}');
   ///for set token
   //  final accessToken = await storage.read(key: "accessToken");
   //  final refreshToken = await storage.read(key: "refreshToken");
   //  options.headers["Authorization"] = "Bearer $accessToken";
    return super.onRequest(options, handler);
  }


  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    logger.e(options.method); // Debug log
    logger.e('Error: ${err.error}, Message: ${err.message}'); // Error log
    logger.d('Response => StatusCode: ${err.response?.statusCode}'); // Debug log
    logger.d('Response => Body: ${err.response?.data}'); // Debug log

    // if (err.response == null) {
    //   return;
    // }
    // if (err.response!.statusCode == 401) {
    //   var res = await refreshToken();
    //   if (res != null && res) {
    //     await _retry(err.requestOptions);
    //   }
    // }
    return super.onError(err, handler);
  }

  /// Api to get new token from refresh token
  ///
  Future<bool?> refreshToken() async {
    ///call your refesh token api here
  }

  /// For retrying request with new token
  ///
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('Response => StatusCode: ${response.statusCode}'); // Debug log
    logger.d('Response => Body: ${response.data}'); // Debug log
    return super.onResponse(response, handler);
  }
}
