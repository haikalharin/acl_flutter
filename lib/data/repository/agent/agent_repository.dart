import 'package:acl_flutter/data/api/login/login_api.dart';
import 'package:acl_flutter/data/model/agent/agent_model.dart';
import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:acl_flutter/data/model/notification_model/notification_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';
import 'package:dio/dio.dart';

import '../../../core/network/api_result.dart';
import '../../../core/repository/repository_helper.dart';
import '../../api/agent/agent_api.dart';



class AgentRepository with RepositoryHelper<AgentModel> {
  final AgentApi agentApi;

  const AgentRepository({required this.agentApi});

  Future<ApiResult<ResponseModel<AgentModel>>> fetchListMyAgent({String? leaderCode}) async {
    return checkItemsWithResponseModelFailOrSuccess(agentApi.fetchListMyAgent(leaderCode: leaderCode));
  }
}