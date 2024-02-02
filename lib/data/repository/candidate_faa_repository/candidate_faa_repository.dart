import 'package:acl_flutter/data/model/candidate_faa/education_candidate_model.dart';
import 'package:acl_flutter/data/remote_data_source/candidate/pending_simple_checking.dart';
import 'package:acl_flutter/data/remote_data_source/candidate/start_process_instance_api.dart';
import 'package:acl_flutter/data/remote_data_source/document/document_api.dart';
import 'package:acl_flutter/data/remote_data_source/master_data/master_data_api.dart';
import 'package:acl_flutter/data/remote_data_source/spouse/sepouse_api.dart';
import 'package:acl_flutter/data/model/candidate/candidate_be_model.dart';
import 'package:acl_flutter/data/model/candidate/candidate_folder_doc_model.dart';
import 'package:acl_flutter/data/model/candidate/request_candidate_doc_model.dart';
import 'package:acl_flutter/data/model/candidate_faa/add_candidate_work_experience_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';
import 'package:dio/dio.dart';

import '../../../core/network/api_result.dart';
import '../../../core/network/dio_exception.dart';
import '../../../core/repository_helper/repository_helper.dart';

import '../../remote_data_source/candidate_faa/add_education_candidate_api.dart';
import '../../remote_data_source/candidate_faa/add_work_eexperience_candidate_api.dart';
import '../../model/candidate/candidate_model.dart';


class CandidateFaaRepository with RepositoryHelper<CandidateModel> {
  final AddWorkExperienceCandidateApi addWorkExperienceCandidateApi;
  final AddEducationCandidateApi addEducationCandidateApi;

  const CandidateFaaRepository({
    required this.addWorkExperienceCandidateApi,
    required this.addEducationCandidateApi,
  });

  Future<ApiResult<ResponseModel<CandidateModel>>>  addCandidateWorkExperience(
      AddCandidateWorkExperienceModel addCandidateWorkExperienceModel) async {
    try {
      final ResponseModel<CandidateModel> items =
          await addWorkExperienceCandidateApi
              .addCandidateWorkExperience(addCandidateWorkExperienceModel);
      return ApiResult.success(items);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<ResponseModel<CandidateModel>>>  addCandidateEducation(
      EducationCandidateModel educationCandidateModel) async {
    try {
      final ResponseModel<CandidateModel> items =
      await addEducationCandidateApi
          .addCandidateEducation(educationCandidateModel);
      return ApiResult.success(items);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }
}
