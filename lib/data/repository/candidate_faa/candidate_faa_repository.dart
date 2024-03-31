import 'package:acl_flutter/data/model/candidate_faa/education_candidate_model.dart';
import 'package:acl_flutter/data/model/candidate_faa/private_data_candidate_request_model.dart';
import 'package:acl_flutter/data/remote_data_source/candidate/pending_simple_checking.dart';
import 'package:acl_flutter/data/remote_data_source/candidate/start_process_instance_api.dart';
import 'package:acl_flutter/data/remote_data_source/candidate_faa/add_register_candidate_private_data_api.dart';
import 'package:acl_flutter/data/remote_data_source/document/document_api.dart';
import 'package:acl_flutter/data/remote_data_source/master_data/master_data_api.dart';
import 'package:acl_flutter/data/remote_data_source/spouse/sepouse_api.dart';
import 'package:acl_flutter/data/model/candidate/candidate_be_model.dart';
import 'package:acl_flutter/data/model/candidate/candidate_folder_doc_model.dart';
import 'package:acl_flutter/data/model/candidate/request_candidate_doc_model.dart';
import 'package:acl_flutter/data/model/candidate_faa/add_candidate_work_experience_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/network/api_result.dart';
import '../../../core/network/dio_exception.dart';
import '../../../core/repository_helper/repository_helper.dart';

import '../../model/candidate_faa/request_families_data.dart';
import '../../model/candidate_faa/response_families_data.dart';
import '../../remote_data_source/candidate/get_candidate_data_documents_api.dart';
import '../../remote_data_source/candidate_faa/add_education_candidate_api.dart';
import '../../remote_data_source/candidate_faa/add_families_data_candidate_api.dart';
import '../../remote_data_source/candidate_faa/add_work_eexperience_candidate_api.dart';
import '../../model/candidate/candidate_model.dart';


class CandidateFaaRepository with RepositoryHelper<CandidateModel> {
  final AddWorkExperienceCandidateApi addWorkExperienceCandidateApi;
  final AddFamiliesDataCandidateApi addFamiliesDataCandidateApi;
  final AddEducationCandidateApi addEducationCandidateApi;
  final AddRegisterCandidatePrivateDataApi addRegisterCandidatePrivateDataApi;

  const CandidateFaaRepository({
    required this.addWorkExperienceCandidateApi,
    required this.addFamiliesDataCandidateApi,
    required this.addEducationCandidateApi,
    required this.addRegisterCandidatePrivateDataApi,
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

  Future<ApiResult<ResponseModel<ResponseFamiliesData>>>  addAddFamiliesData(
      RequestFamiliesData requestFamiliesData) async {
    try {
      final ResponseModel<ResponseFamiliesData> items =
      await addFamiliesDataCandidateApi
          .addAddFamiliesData(requestFamiliesData);
      return ApiResult.success(items);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<ResponseModel<PrivateDataCandidateRequestModel>>> addRegisterCandidatePrivateData(
      PrivateDataCandidateRequestModel privateDataCandidateRequestModel) async {
    try {
      final ResponseModel<PrivateDataCandidateRequestModel> items =
      await addRegisterCandidatePrivateDataApi
          .addRegisterCandidatePrivateData(privateDataCandidateRequestModel);
      return ApiResult.success(items);
    } on DioException catch (e) {
      var data = e;
      if (kDebugMode) {
        print("$data");
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }
}
