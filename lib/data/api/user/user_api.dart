import 'package:acl_flutter/core/network/api_config.dart';
import 'package:acl_flutter/core/network/api_helper.dart';
import 'package:acl_flutter/core/network/dio_client.dart';
import 'package:acl_flutter/core/network/service_url.dart';
import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:acl_flutter/data/model/user/user.dart';

class UserApi with ApiHelper<User> {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<bool> createUser(User user) async {
    return await makePostRequest(dioClient.dio.post(ApiConfig.users, data: user));
  }

  Future<bool> updateUser(User user) async {
    return await makePutRequest(dioClient.dio.put("${ApiConfig.users}/${user.id}", data: user));
  }

  Future<bool> deleteUser(User user) async {
    return await makeDeleteRequest(dioClient.dio.delete("${ApiConfig.users}/${user.id}"));
  }
  Future<List<User>> getUsers({Gender? gender, UserStatus? status}) async {
    Map<String, String> queryParameters = <String, String>{};

    if (gender != null && gender != Gender.all) {
      queryParameters.addAll({'gender': gender.name});
    }

    if (status != null && status != UserStatus.all) {
      queryParameters.addAll({'status': status.name});
    }

    return await makeGetRequest(dioClient.dio.get(ApiConfig.users, queryParameters: queryParameters), User.fromJson);
  }
}
