import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_be_model.dart';

class CandidateBeApi with ApiHelper<CandidateBeModel> {
  final DioClient dioClient;

  CandidateBeApi({required this.dioClient});

  Future<ResponseModel<CandidateBeModel>> fetchListBeAgent({String? leaderCode}) async {
    return await makeGetRequestWithResponseModel(
        dioClient.dio.get(
          "${ServiceUrl.listBeAgent}/$leaderCode"
        ),
        CandidateBeModel.fromJson);
  }
}
