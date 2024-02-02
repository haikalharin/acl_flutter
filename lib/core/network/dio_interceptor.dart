// ignore_for_file: deprecated_member_use

import 'package:acl_flutter/common/app_extension.dart';
import 'package:acl_flutter/core/network/service_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

import '../../data/model/login_model/login_model.dart';
import '../../myApp.dart';
import '../../utils/remote_utils.dart';
import '../local_storage/secure_storage/secure_storage.dart';
import '../router/routes.dart';
import 'api_helper.dart';

class DioInterceptor extends Interceptor with ApiHelper<dynamic> {
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
    final accessToken = await storage.read(key: SecureStorage.token);
    //  final refreshToken = await storage.read(key: "refreshToken");
    if(!options.path.contains('login')) {
      options.headers["Authorization"] = "$accessToken";
    }
    return super.onRequest(options, handler);
  }


  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    logger.e(options.method); // Debug log
    logger.e('Error: ${err.error}, Message: ${err.message}'); // Error log
    logger.d('Response => StatusCode: ${err.response?.statusCode}'); // Debug log
    logger.d('Response => Body: ${err.response?.data}'); // Debug log
    RequestOptions? origin = err.response?.requestOptions;

    if (err.response == null) {
      return;
    }
    if (err.response!.statusCode == 403) {
      var response = await refreshToken(err,handler);

      if (response?.statusCode == 200) {
        SecureStorage()
            .setToken(response?.data['data'] ?? '');
        var newAccessToken = response?.data['data'] ?? '';
        SecureStorage()
            .setToken(newAccessToken);
        err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

        var cloneReq =  await _retry(err.requestOptions);
        return handler.resolve(cloneReq);

      } else {
        SecureStorage().secureDeleteAll();
        alice.getNavigatorKey()?.currentState?.pushNamedAndRemoveUntil(
          Routes.initialPage,
              (Route<dynamic> route) => false,
        );
        return super.onError(err, handler);
      }

    } else{
      return super.onError(err, handler);
    }

  }

  /// Api to get new token from refresh token
  ///
  Future<Response?> refreshToken(DioError err, ErrorInterceptorHandler handler) async {
    Response? response ;
    try {
      var deviceId = await getId();
      LoginModel loginModel = await SecureStorage().getUser();
      Map<String, dynamic> data = {"userId":loginModel.uid,"fullName":loginModel.name,"group":["acl"]};
      response = await dio.post(
          'https://acl-api-nonprd.allianz.co.id/v2/acl/api/authentication/login/token/generation',
          data: data
      );

      if (kDebugMode) {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
    return response;

    ///call your refesh token api here
  }

  /// For retrying request with new token
  Future<Response> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return await makePostRequestWithResponse(dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options));
  }
  // Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
  //
  //
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: requestOptions.headers,
  //   );
  //   return dio.request<dynamic>(requestOptions.path,
  //       data: requestOptions.data,
  //       queryParameters: requestOptions.queryParameters,
  //       options: options);
  // }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('Response => StatusCode: ${response.statusCode}'); // Debug log
    logger.d('Response => Body: ${response.data}'); // Debug log
    return super.onResponse(response, handler);
  }
}