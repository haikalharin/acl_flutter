import 'dart:convert';

import 'package:acl_flutter/data/model/response_model/response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/remote_utils.dart';
import '../core/exceptions/server_error_exception.dart';
import '../core/network/dio_exception.dart';
import '../core/network/http_constants.dart';

class HttpUtil {
  static dynamic encodeRequestBody(dynamic data, String contentType) {
    return contentType == HttpConstants.jsonContentType
        ? utf8.encode(json.encode(data))
        : data;
  }

  static dynamic getResponse(Response response) {
    debugPrint('>>>>>>> ${response.data}');
    switch (response.statusCode) {
      case 200:
        return _getSuccessResponse(response);
      default:
        throw DioExceptions;
    }
  }

  static dynamic _getSuccessResponse(Response response) {
    final _responseJson = response.data;
    dynamic data = _responseJson;
    String dataString = _responseJson.toString();
    debugPrint('>>>>>>> [RESPONSE] $_responseJson');
    if(!dataString.contains('data:')){
      data = {'data': _responseJson ?? ''};
    }
    return data;
  }

  static dynamic _tokenExpired(Response response) {
    final _responseJson = json.decode(response.data);

    debugPrint('>>>>>>> [Token Expired Response] $_responseJson');
    // AppSharedPreference.clear();
    //FIX SCREEN ONBOARDING MENUMPUK SAAT SESSION EXPIRED
    // navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const LoginPage(tokenExpired: true,)), (route) => false);
    //navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (BuildContext context) => OnBoardingScreen(isHavePopUpMessage: "401",)));
    return _responseJson;
  }
}