import 'package:acl_flutter/data/model/agent/agent_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';

class AgentApi with ApiHelper<AgentModel> {
  final DioClient dioClient;

  AgentApi({required this.dioClient});

  Future<ResponseModel<AgentModel>> fetchListMyAgent({String? leaderCode}) async {
    Map<String, String> data = {'leaderAgentCode': leaderCode ?? ''};

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.listMyAgent,
          data: data,
        ),
        AgentModel.fromJson);
  }
}
