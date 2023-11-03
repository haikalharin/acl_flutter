import 'package:dio/dio.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;

  RefreshTokenInterceptor({
    required this.dio,
  });


  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response == null) {
      return;
    }
    if (err.response!.statusCode == 401) {
      var res = await refreshToken();
      if (res != null && res) {
        await _retry(err.requestOptions);
      }
    }
    return handler.next(err);
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
}