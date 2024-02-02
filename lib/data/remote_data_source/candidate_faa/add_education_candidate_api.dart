import 'package:acl_flutter/data/model/candidate_faa/add_candidate_work_experience_model.dart';
import 'package:acl_flutter/data/model/candidate_faa/education_candidate_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_model.dart';
import '../../model/candidate/candidate_register_model.dart';
import '../../model/candidate/request_candidate_model.dart';

class AddEducationCandidateApi with ApiHelper<CandidateModel> {
  final DioClient dioClient;

  AddEducationCandidateApi({required this.dioClient});

  Future<ResponseModel<CandidateModel>> addCandidateEducation(
      EducationCandidateModel educationCandidateModel) async {
    Map<String, dynamic> data = educationCandidateModel.toJson();

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.addEducationCandidate,
          data: data,
        ),
        CandidateModel.fromJson);
  }


}
