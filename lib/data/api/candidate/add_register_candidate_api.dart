import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_register_model.dart';
import '../../model/candidate/request_candidate_model.dart';

class AddRegisterCandidateApi with ApiHelper<CandidateRegisterModel> {
  final DioClient dioClient;

  AddRegisterCandidateApi({required this.dioClient});

  Future<ResponseModel<CandidateRegisterModel>> addRegisterCandidate(
      RequestCandidateModel requestCandidateModel) async {
    Map<String, dynamic> data = requestCandidateModel.toJson();

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.addRegisterCandidate,
          data: data,
        ),
        CandidateRegisterModel.fromJson);
  }


}
