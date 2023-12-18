import 'package:acl_flutter/data/model/response_model/response_model.dart';
import 'package:acl_flutter/data/model/sepouse/request_sepouse_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_model.dart';
import '../../model/candidate/request_candidate_model.dart';

class AddRegisterSepouseApi with ApiHelper<CandidateModel> {
  final DioClient dioClient;

  AddRegisterSepouseApi({required this.dioClient});

  Future<ResponseModel<CandidateModel>> addRegisterSepouse(RequestSepouseModel requestSepouseModel) async {
    Map<String, dynamic> data = requestSepouseModel.toJson();

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.addSepouseCandidate,
          data: data,
        ),
        CandidateModel.fromJson);
  }
}
