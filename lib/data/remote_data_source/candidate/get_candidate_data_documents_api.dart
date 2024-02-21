import 'package:acl_flutter/data/model/documents/documents_response_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_data_model.dart';

class GetCandidateDataDocumentsApi with ApiHelper<DocumentsResponseModel> {
  final DioClient dioClient;

  GetCandidateDataDocumentsApi({required this.dioClient});

  Future<ResponseModel<DocumentsResponseModel>> getCandidateDataDoc(
      {required String agentCode, required String candidateId}) async {
    Map<String, dynamic> data = {
      "agentCode": agentCode,
      "candidateId": candidateId
    };

    return await makeGetRequestWithResponseModel(
        dioClient.dio.get(
          ServiceUrl.getCandidateDataDoc,
          queryParameters: data,
        ),
        DocumentsResponseModel.fromJson);
  }
}
