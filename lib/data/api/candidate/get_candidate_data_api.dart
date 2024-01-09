import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client_new.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_data_model.dart';

class GetCandidateDataApi with ApiHelper<CandidateDataModel> {
  final DioClientNew dioClient;

  GetCandidateDataApi({required this.dioClient});

  Future<ResponseModel<CandidateDataModel>> addRegisterCandidate(
      String candidateId) async {
    Map<String, dynamic> data = {"id": candidateId};

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.getCandidateData,
          data: data,
        ),
        CandidateDataModel.fromJson);
  }


}
