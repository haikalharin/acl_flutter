import 'package:acl_flutter/data/model/notification_model/notification_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';

class NotifyApi with ApiHelper<NotificationModel> {
  final DioClient dioClient;

  NotifyApi({required this.dioClient});

  Future<ResponseModel<NotificationModel>> fetchListNotify({String? leaderCode}) async {
    Map<String, String> data = {'userId': leaderCode ?? ''};

    return await makeGetRequestWithResponseModel(
        dioClient.dio.get(
          ServiceUrl.listNotify,
          queryParameters: data,
        ),
        NotificationModel.fromJson);
  }
}
