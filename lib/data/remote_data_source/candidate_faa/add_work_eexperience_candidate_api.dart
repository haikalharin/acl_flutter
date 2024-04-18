import 'package:acl_flutter/data/model/candidate_faa/add_candidate_work_experience_model.dart';
import 'package:acl_flutter/data/model/candidate_faa/work_experience_reinstance.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_model.dart';
import '../../model/candidate/candidate_register_model.dart';
import '../../model/candidate/request_candidate_model.dart';

class AddWorkExperienceCandidateApi with ApiHelper<CandidateModel> {
  final DioClient dioClient;

  AddWorkExperienceCandidateApi({required this.dioClient});

  Future<ResponseModel<CandidateModel>> addCandidateWorkExperience(
      AddCandidateWorkExperienceModel addCandidateWorkExperienceModel) async {
    Map<String, dynamic> data = addCandidateWorkExperienceModel.toJson();

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.addWorkExperienceCandidate,
          data: data,
        ),
        CandidateModel.fromJson);
  }

  Future<ResponseModel<CandidateModel>> putWorkExperienceReinstance(
      WorkExperienceReinstance workExperienceReinstance, String userId) async {
    Map<String, dynamic> data = workExperienceReinstance.toJson();

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.putWorkExperienceReinstance,
          queryParameters:{ "userId":userId},
          data: data,
        ),
        CandidateModel.fromJson);
  }


}
