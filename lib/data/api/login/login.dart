import 'package:acl_flutter/common/configurations/configurations.dart';
import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:dio/dio.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../../core/repository/shared_preference/app_shared_preference.dart';

class LoginApi with ApiHelper<LoginModel> {
  final DioClient dioClient;

  LoginApi({required this.dioClient});

  Future<LoginModel> login({String? userName, String? password}) async {
    Map<String, String> data = <String, String>{};

    if (userName != null){
      data.addAll({'username': userName});
    }

    if (password != null) {
      data.addAll({'password': password});
    }

    return await makePostRequestWithData(dioClient.dio.post(ServiceUrl.login, data: data,), LoginModel.fromJson);
  }

  Future<LoginModel> getList({String? userName, String? password}) async {
    Map<String, String> data = <String, String>{};
    final String? token = await AppSharedPreference.getToken();


    if (userName != null){
      data.addAll({'username': userName});
    }

    if (password != null) {
      data.addAll({'password': password});
    }

    return await makePostRequestWithData(dioClient.dio.get(ServiceUrl.login, data: data, options: Options(headers: {
      "Content-Type": "application/json",
      "Authorization":
      "Bearer $token",
    })), LoginModel.fromJson);
  }
}