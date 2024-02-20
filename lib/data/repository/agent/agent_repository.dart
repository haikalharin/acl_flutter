import 'package:acl_flutter/data/model/agent_model/profile_agent_model.dart';
import 'package:acl_flutter/data/remote_data_source/agent/get_agent_data_api.dart';
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

class AgentRepository with RepositoryHelper<ProfileAgentModel> {

  final AgentDataApi agentDataApi;

  const AgentRepository({

    required this.agentDataApi,
  });

  Future<ApiResult<ResponseModel<ProfileAgentModel>>> getDataAgent(
      {required String leaderCode}) async {
    try {
      final ResponseModel<ProfileAgentModel> items =
          await agentDataApi.getDataAgent( leaderCode??'');
      return ApiResult.success(items);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(errorMessage);
    }
  }

}
