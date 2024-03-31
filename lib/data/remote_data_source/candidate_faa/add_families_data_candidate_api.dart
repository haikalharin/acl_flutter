import 'package:acl_flutter/data/model/candidate_faa/add_candidate_work_experience_model.dart';
import 'package:acl_flutter/data/model/candidate_faa/request_families_data.dart';
import 'package:acl_flutter/data/model/candidate_faa/response_families_data.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_model.dart';
import '../../model/candidate/candidate_register_model.dart';
import '../../model/candidate/request_candidate_model.dart';

class AddFamiliesDataCandidateApi with ApiHelper<ResponseFamiliesData> {
  final DioClient dioClient;

  AddFamiliesDataCandidateApi({required this.dioClient});

  Future<ResponseModel<ResponseFamiliesData>> addAddFamiliesData(
      RequestFamiliesData requestFamiliesData) async {
    Map<String, dynamic> data = requestFamiliesData.toJson();
    List<Map<String, dynamic>> listData = [data];
    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.addFamiliesData,
          data: listData,
        ),
        ResponseFamiliesData.fromJson);
  }


}
