import 'package:acl_flutter/data/remote_data_source/login/login_api.dart';
import 'package:dio/dio.dart';

import '../../../core/network/api_result.dart';
import '../../../core/repository_helper/repository_helper.dart';


class LoginRepository with RepositoryHelper<Response> {
  final LoginApi loginApi;

  const LoginRepository({required this.loginApi});

  Future<ApiResult<Response>> login({String? userName, String? password}) async {
    return checkItemWithDataFailOrSuccess(loginApi.login(userName: userName, password: password));
  }
}