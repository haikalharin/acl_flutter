import 'package:acl_flutter/data/api/login/login_api.dart';
import 'package:acl_flutter/data/api/master_data/master_data_api.dart';
import 'package:acl_flutter/data/model/agent/agent_model.dart';
import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:acl_flutter/data/model/master_data_model/master_data_model.dart';
import 'package:acl_flutter/data/model/notification_model/notification_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';
import 'package:dio/dio.dart';

import '../../../core/network/api_result.dart';
import '../../../core/network/dio_exception.dart';
import '../../../core/repository/repository_helper.dart';
import '../../api/agent/agent_api.dart';
import '../../api/agent/agent_be_api.dart';
import '../../model/agent/agent_be_model.dart';

class AgentRepository with RepositoryHelper<AgentModel> {
  final AgentApi agentApi;
  final AgentBeApi agentBeApi;
  final MasterDataApi masterDataApi;

  const AgentRepository({required this.agentApi,required this.agentBeApi, required this.masterDataApi,});

  Future<ApiResult<ResponseModel<AgentModel>>> fetchListMyAgent(
      {String? leaderCode}) async {
    try {
      final ResponseModel<AgentModel> items =
          await agentApi.fetchListMyAgent(leaderCode: leaderCode);
      return ApiResult.success(items);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<ResponseModel<AgentBeModel>>> fetchListBeAgent(
      {String? leaderCode}) async {
    try {
      final ResponseModel<AgentBeModel> items =
      await agentBeApi.fetchListBeAgent(leaderCode: leaderCode);
      return ApiResult.success(items);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<ResponseModel<MasterDataModel>>> fetchMasterData() async {
    try {
      final ResponseModel<MasterDataModel> items =
      await masterDataApi.fetchMasterData();
      return ApiResult.success(items);
    } on DioException catch (e) {
      var data = e;
      print(data);
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }
}
