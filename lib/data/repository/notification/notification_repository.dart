import 'package:acl_flutter/data/api/login/login_api.dart';
import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:acl_flutter/data/model/notification_model/notification_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';
import 'package:dio/dio.dart';

import '../../../core/network/api_result.dart';
import '../../../core/repository/repository_helper.dart';
import '../../api/notify/notify_api.dart';



class NotificationRepository with RepositoryHelper<NotificationModel> {
  final NotifyApi notifyApi;

  const NotificationRepository({required this.notifyApi});
  

  Future<ApiResult<ResponseModel<NotificationModel>>> fetchListNotify({String? leaderCode}) async {
    return checkItemsWithResponseModelFailOrSuccess(notifyApi.fetchListNotify(leaderCode: leaderCode));
  }
}