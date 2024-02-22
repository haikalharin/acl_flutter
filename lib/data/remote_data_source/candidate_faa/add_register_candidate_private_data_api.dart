import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_register_model.dart';
import '../../model/candidate/request_candidate_model.dart';
import '../../model/candidate_faa/private_data_candidate_request_model.dart';

class AddRegisterCandidatePrivateDataApi with ApiHelper<PrivateDataCandidateRequestModel> {
  final DioClient dioClient;

  AddRegisterCandidatePrivateDataApi({required this.dioClient});

  Future<ResponseModel<PrivateDataCandidateRequestModel>> addRegisterCandidatePrivateData(
      PrivateDataCandidateRequestModel privateDataCandidateRequestModel) async {
    Map<String, dynamic> data = privateDataCandidateRequestModel.toJson();

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.addRegisterCandidateFaa,
          data: data,
        ),
        PrivateDataCandidateRequestModel.fromJson);
  }


}
