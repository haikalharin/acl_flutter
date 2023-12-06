import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_model.dart';

class CandidateApi with ApiHelper<CandidateModel> {
  final DioClient dioClient;

  CandidateApi({required this.dioClient});

  Future<ResponseModel<CandidateModel>> fetchListMyAgent({String? leaderCode}) async {
    Map<String, String> data = {'leaderAgentCode': leaderCode ?? ''};

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.listMyAgent,
          data: data,
        ),
        CandidateModel.fromJson);
  }
}
