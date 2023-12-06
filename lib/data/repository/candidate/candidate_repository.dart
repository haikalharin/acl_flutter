import 'package:acl_flutter/data/api/login/login_api.dart';
import 'package:acl_flutter/data/api/master_data/master_data_api.dart';
import 'package:acl_flutter/data/model/candidate/candidate_be_model.dart';
import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:acl_flutter/data/model/master_data_model/master_data_model.dart';
import 'package:acl_flutter/data/model/notification_model/notification_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';
import 'package:dio/dio.dart';

import '../../../core/network/api_result.dart';
import '../../../core/network/dio_exception.dart';
import '../../../core/repository/repository_helper.dart';

import '../../api/candidate/candiate_be_api.dart';
import '../../api/candidate/candidate_api.dart';
import '../../api/candidate/tracking_candidate_api.dart';
import '../../model/candidate/candidate_model.dart';
import '../../model/tracking_model/tracking_model.dart';

class CandidateRepository with RepositoryHelper<CandidateModel> {
  final CandidateApi candidateApi;
  final CandidateBeApi candidateBeApi;
  final MasterDataApi masterDataApi;
  final TrackingCandidateApi trackingCandidateApi;

  const CandidateRepository({
    required this.trackingCandidateApi,
    required this.candidateApi,
    required this.candidateBeApi,
    required this.masterDataApi,
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
      print(data);
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }
}
