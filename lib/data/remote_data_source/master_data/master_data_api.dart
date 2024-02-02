import 'package:acl_flutter/data/model/master_data_model/master_data_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';

class MasterDataApi with ApiHelper<MasterDataModel> {
  final DioClient dioClient;

  MasterDataApi({required this.dioClient});

  Future<ResponseModel<MasterDataModel>> fetchMasterData() async {
    return await makeGetRequestWithResponseModel(
        dioClient.dio.get(
          ServiceUrl.masterData
        ),
        MasterDataModel.fromJson);
  }
}
