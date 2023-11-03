import 'package:acl_flutter/core/network/api_result.dart';
import 'package:acl_flutter/core/repository/repository_helper.dart';
import 'package:acl_flutter/data/api/login/login.dart';
import 'package:acl_flutter/data/api/user/user_api.dart';
import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:acl_flutter/data/model/user/user.dart';

class UserRepository with RepositoryHelper<User> {
  final UserApi userApi;

  UserRepository({required this.userApi});

  Future<ApiResult<List<User>>> getUsers({Gender? gender, UserStatus? status}) async {
    return checkItemsFailOrSuccess(userApi.getUsers(gender: gender, status: status));
  }
  Future<ApiResult<bool>> createUser(User user) async {
    return checkItemFailOrSuccess(userApi.createUser(user));
  }

  Future<ApiResult<bool>> updateUser(User user) async {
    return checkItemFailOrSuccess(userApi.updateUser(user));
  }

  Future<ApiResult<bool>> deleteUser(User user) async {
    return checkItemFailOrSuccess(userApi.deleteUser(user));
  }
}
