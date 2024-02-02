import 'package:acl_flutter/data/model/candidate/candidate_folder_doc_model.dart';
import 'package:acl_flutter/data/model/candidate/request_candidate_doc_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';

class DocumentApi with ApiHelper<CandidateFolderDocModel> {
  final DioClient dioClient;

  DocumentApi({required this.dioClient});


  Future<ResponseModel<CandidateFolderDocModel>> addRegisterCandidateDoc(
      RequestCandidateDocModel requestCandidateDocModel) async {
    Map<String, dynamic> data = requestCandidateDocModel.toJson();

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.addRegisterCandidateDoc,
          data: data,
        ),
        CandidateFolderDocModel.fromJson);
  }

  Future<ResponseModel<CandidateFolderDocModel>> addRegisterCandidateFolderDoc(
      String candidateId) async {
    Map<String, dynamic> data = {"candidateId": candidateId};

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.addRegisterCandidateFolderDoc,
          data: data,
        ),
        CandidateFolderDocModel.fromJson);
  }
}