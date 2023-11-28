import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/agent/agent_be_model.dart';

class AgentBeApi with ApiHelper<AgentBeModel> {
  final DioClient dioClient;

  AgentBeApi({required this.dioClient});

  Future<ResponseModel<AgentBeModel>> fetchListBeAgent({String? leaderCode}) async {
    return await makeGetRequestWithResponseModel(
        dioClient.dio.get(
          "${ServiceUrl.listBeAgent}/$leaderCode"
        ),
        AgentBeModel.fromJson);
  }
}
