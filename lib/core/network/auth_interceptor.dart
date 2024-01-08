import 'package:dio/dio.dart';

// ignore_for_file: deprecated_member_use

import 'package:acl_flutter/common/app_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

import '../../myApp.dart';
import '../local_storage/secure_storage/secure_storage.dart';
import '../local_storage/shared_preference/app_shared_preference.dart';
import '../router/routes.dart';


class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);
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
    final accessToken = await storage.read(key: AppSharedPreference.token);
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

    if (err.response == null) {
      return;
    }
    if (err.response!.statusCode == 403 || err.response?.statusCode == 500) {
      var response = await refreshToken();

      if (response?.statusCode == 200) {
        var newAccessToken = response?.headers.map['Authorization']?.first ?? '';
        SecureStorage()
            .setToken(newAccessToken);
        err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
        await _retry(err.requestOptions);
      } else {
        SecureStorage().secureDeleteAll();
        AppSharedPreference.clear();
        alice.getNavigatorKey()?.currentState?.pushNamedAndRemoveUntil(
          Routes.initialPage,
              (Route<dynamic> route) => false,
        );
      }
    }
    return super.onError(err, handler);
  }

  /// Api to get new token from refresh token
  ///
  Future<Response?> refreshToken() async {
    Response? response ;
    try {
      response = await dio.post(
        '/path/to/your/endpoint',
      );

      print(response.data);
    } on DioError catch (e) {
      print(e.message);
    }
    return response;
  
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


// class RefreshTokenInterceptor extends Interceptor {
//   final Dio dio;
//
//   RefreshTokenInterceptor({
//     required this.dio,
//   });
//
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (err.response == null) {
//       return;
//     }
//     if (err.response!.statusCode == 401) {
//       var res = await refreshToken();
//       if (res != null && res) {
//         await _retry(err.requestOptions);
//       }
//     }
//     return handler.next(err);
//   }
//
//   /// Api to get new token from refresh token
//   ///
//   Future<bool?> refreshToken() async {
//     ///call your refesh token api here
//   }
//
//   /// For retrying request with new token
//   ///
//   Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
//     final options = Options(
//       method: requestOptions.method,
//       headers: requestOptions.headers,
//     );
//     return dio.request<dynamic>(requestOptions.path,
//         data: requestOptions.data,
//         queryParameters: requestOptions.queryParameters,
//         options: options);
//   }
// }