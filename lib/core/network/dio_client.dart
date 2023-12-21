import 'package:acl_flutter/core/network/api_config.dart';
import 'package:acl_flutter/core/network/dio_interceptor.dart';
import 'package:dio/dio.dart' show Dio, Interceptor, ResponseType;
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:flutter/foundation.dart';

import '../../common/configurations/configurations.dart';
import '../../flavors.dart';
import '../../myApp.dart';
import 'auth_interceptor.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    Iterable<Interceptor> interceptor =[];

    if( F.appFlavor == Flavor.DEVELOPMENT){
      if(kReleaseMode){
        interceptor = [DioInterceptor(dio),alice.getDioInterceptor()];
      } else{
        interceptor = [DioInterceptor(dio), CurlLoggerDioInterceptor(printOnSuccess: true),alice.getDioInterceptor()];
      }
    }

    if( F.appFlavor == Flavor.STAGING){
      if(kReleaseMode){
        interceptor = [DioInterceptor(dio),alice.getDioInterceptor()];
      } else{
        interceptor = [DioInterceptor(dio), CurlLoggerDioInterceptor(printOnSuccess: true),alice.getDioInterceptor()];
      }
    }

    if( F.appFlavor == Flavor.PRODUCTION){
      if(kReleaseMode){
        interceptor = [DioInterceptor(dio)];
      } else{
        interceptor = [DioInterceptor(dio), CurlLoggerDioInterceptor(printOnSuccess: true),alice.getDioInterceptor()];
      }
    }


      dio
        ..options.baseUrl = Configurations.host
        ..options.headers = ApiConfig.header
        ..options.connectTimeout = ApiConfig.connectionTimeout
        ..options.receiveTimeout = ApiConfig.receiveTimeout
        ..options.responseType = ResponseType.json
        ..interceptors.addAll(interceptor);

  }
}
