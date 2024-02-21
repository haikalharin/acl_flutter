import 'package:acl_flutter/data/model/agent_model/profile_agent_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_data_model.dart';

class AgentDataApi with ApiHelper<ProfileAgentModel> {
  final DioClient dioClient;

  AgentDataApi({required this.dioClient});

  Future<ResponseModel<ProfileAgentModel>> getDataAgent(
      String agentId) async {

    return await makeGetRequestWithResponseModel(
        dioClient.dio.get(
          "${ServiceUrl.getDataAgent}/$agentId",
        ),
        ProfileAgentModel.fromJson);
  }


}
