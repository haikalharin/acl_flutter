import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_register_model.dart';
import '../../model/candidate/request_pending_simple_checking_model.dart';

class StartProcessInstanceApi with ApiHelper<CandidateRegisterModel> {
  final DioClient dioClient;

  StartProcessInstanceApi({required this.dioClient});

  Future<ResponseModel<CandidateRegisterModel>> startProcessInstance(
      String candidateId) async {
    Map<String, dynamic> data = {"userId":candidateId};

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.startProcessInstance,
          data: data,
        ),
        CandidateRegisterModel.fromJson);
  }


}
