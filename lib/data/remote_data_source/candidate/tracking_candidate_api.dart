import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/tracking_model/tracking_model.dart';

class TrackingCandidateApi with ApiHelper<TrackingModel> {
  final DioClient dioClient;

  TrackingCandidateApi({required this.dioClient});

  Future<ResponseModel<TrackingModel>> fetchListTracking({String? candidateId}) async {
    Map<String, String> data = {'candidateId': candidateId ?? ''};

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.listTracking,
          data: data,
        ),
        TrackingModel.fromJson);
  }
}
