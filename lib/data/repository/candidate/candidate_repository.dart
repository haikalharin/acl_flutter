import 'package:acl_flutter/data/model/documents/documents_response_model.dart';
import 'package:acl_flutter/data/remote_data_source/candidate/get_candidate_data_documents_api.dart';
import 'package:acl_flutter/data/remote_data_source/candidate/pending_simple_checking.dart';
import 'package:acl_flutter/data/remote_data_source/candidate/start_process_instance_api.dart';
import 'package:acl_flutter/data/remote_data_source/document/document_api.dart';
import 'package:acl_flutter/data/remote_data_source/master_data/master_data_api.dart';
import 'package:acl_flutter/data/remote_data_source/spouse/sepouse_api.dart';
import 'package:acl_flutter/data/model/candidate/candidate_be_model.dart';
import 'package:acl_flutter/data/model/candidate/candidate_folder_doc_model.dart';
import 'package:acl_flutter/data/model/candidate/request_candidate_doc_model.dart';
import 'package:acl_flutter/data/model/master_data_model/master_data_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';
import 'package:acl_flutter/data/model/sepouse/request_sepouse_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/network/api_result.dart';
import '../../../core/network/dio_exception.dart';
import '../../../core/repository_helper/repository_helper.dart';

import '../../remote_data_source/candidate/add_register_candidate_api.dart';
import '../../remote_data_source/candidate/candiate_be_api.dart';
import '../../remote_data_source/candidate/candidate_api.dart';
import '../../remote_data_source/candidate/get_candidate_data_api.dart';
import '../../remote_data_source/candidate/tracking_candidate_api.dart';
import '../../model/candidate/candidate_model.dart';
import '../../model/candidate/candidate_register_model.dart';
import '../../model/candidate/candidate_data_model.dart';
import '../../model/candidate/request_candidate_model.dart';
import '../../model/candidate/request_pending_simple_checking_model.dart';
import '../../model/tracking_model/tracking_model.dart';

class CandidateRepository with RepositoryHelper<CandidateModel> {
  final CandidateApi candidateApi;
  final CandidateBeApi candidateBeApi;
  final MasterDataApi masterDataApi;
  final TrackingCandidateApi trackingCandidateApi;
  final AddRegisterCandidateApi addRegisterCandidateApi;
  final AddRegisterSepouseApi addRegisterSepouseApi;
  final DocumentApi documentApi;
  final PendingSimpleCheckingApi pendingSimpleCheckingApi;
  final GetCandidateDataApi getCandidateDataApi;
  final StartProcessInstanceApi startProcessInstanceApi;
  final GetCandidateDataDocumentsApi getCandidateDataDocumentsApi;

  const CandidateRepository({
    required this.documentApi,
    required this.addRegisterSepouseApi,
    required this.trackingCandidateApi,
    required this.candidateApi,
    required this.candidateBeApi,
    required this.masterDataApi,
    required this.addRegisterCandidateApi,
    required this.pendingSimpleCheckingApi,
    required this.getCandidateDataApi,
    required this.startProcessInstanceApi,
    required this.getCandidateDataDocumentsApi,
  });

  Future<ApiResult<ResponseModel<CandidateModel>>> fetchListMyAgent(
      {String? leaderCode}) async {
    try {
      final ResponseModel<CandidateModel> items =
          await candidateApi.fetchListMyAgent(leaderCode: leaderCode);
      return ApiResult.success(items);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<ResponseModel<CandidateBeModel>>> fetchListBeAgent(
      {String? leaderCode}) async {
    try {
      final ResponseModel<CandidateBeModel> items =
          await candidateBeApi.fetchListBeAgent(leaderCode: leaderCode);
      return ApiResult.success(items);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<ResponseModel<TrackingModel>>> fetchListTracking(
      {String? candidateId}) async {
    try {
      final ResponseModel<TrackingModel> items = await trackingCandidateApi
          .fetchListTracking(candidateId: candidateId);
      return ApiResult.success(items);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<ResponseModel<MasterDataModel>>> fetchMasterData() async {
    try {
      final ResponseModel<MasterDataModel> items =
          await masterDataApi.fetchMasterData();
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

  Future<ApiResult<ResponseModel<CandidateRegisterModel>>> addRegisterCandidate(
      RequestCandidateModel requestCandidateModel) async {
    try {
      final ResponseModel<CandidateRegisterModel> items =
          await addRegisterCandidateApi
              .addRegisterCandidate(requestCandidateModel);
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

  Future<ApiResult<ResponseModel<CandidateRegisterModel>>>
      pendingSimpleChecking(
          RequestPendingSimpleCheckingModel
              requestPendingSimpleCheckingModel) async {
    try {
      final ResponseModel<CandidateRegisterModel> items =
          await pendingSimpleCheckingApi
              .pendingSimpleChecking(requestPendingSimpleCheckingModel);
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

  Future<ApiResult<ResponseModel<CandidateRegisterModel>>> startProcessInstance(
      String candidateId) async {
    try {
      final ResponseModel<CandidateRegisterModel> items =
          await startProcessInstanceApi.startProcessInstance(candidateId);
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

  Future<ApiResult<ResponseModel<CandidateFolderDocModel>>>
      addRegisterCandidateDoc(
          RequestCandidateDocModel requestCandidateDocModel) async {
    try {
      final ResponseModel<CandidateFolderDocModel> items =
          await documentApi.addRegisterCandidateDoc(requestCandidateDocModel);
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

  Future<ApiResult<ResponseModel<RequestSepouseModel>>> addRegisterSepouse(
      RequestSepouseModel requestSepouseModel) async {
    try {
      final ResponseModel<RequestSepouseModel> items =
          await addRegisterSepouseApi.addRegisterSepouse(requestSepouseModel);
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

  Future<ApiResult<ResponseModel<CandidateFolderDocModel>>> addFolderDoc(
      String candidateId) async {
    try {
      final ResponseModel<CandidateFolderDocModel> items =
          await documentApi.addRegisterCandidateFolderDoc(candidateId);
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

  Future<ApiResult<ResponseModel<CandidateDataModel>>> getCandidateData(
      String candidateId) async {
    try {
      final ResponseModel<CandidateDataModel> items =
          await getCandidateDataApi.addRegisterCandidate(candidateId);
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

  Future<ApiResult<ResponseModel<DocumentsResponseModel>>> getCandidateDataDoc(
      {required String agentCode, required String candidateId}) async {
    try {
      final ResponseModel<DocumentsResponseModel> items =
          await getCandidateDataDocumentsApi.getCandidateDataDoc(
              agentCode: agentCode, candidateId: candidateId);
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
