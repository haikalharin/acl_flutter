import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_register_model.dart';
import '../../model/candidate/request_pending_simple_checking_model.dart';

class PendingSimpleCheckingApi with ApiHelper<CandidateRegisterModel> {
  final DioClient dioClient;

  PendingSimpleCheckingApi({required this.dioClient});

  Future<ResponseModel<CandidateRegisterModel>> pendingSimpleChecking(
      RequestPendingSimpleCheckingModel requestPendingSimpleCheckingModel) async {
    Map<String, dynamic> data = requestPendingSimpleCheckingModel.toJson();

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.submitPendingSimpleChecking,
          data: data,
        ),
        CandidateRegisterModel.fromJson);
  }


}
