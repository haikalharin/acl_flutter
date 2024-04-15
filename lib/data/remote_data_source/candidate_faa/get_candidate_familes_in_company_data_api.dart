import 'package:acl_flutter/data/model/candidate_faa/family_card_model.dart';
import 'package:acl_flutter/data/model/candidate_faa/response_families_data.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_data_model.dart';

class GetCandidateFamiliesInCompanyDataApi with ApiHelper<ResponseFamiliesData> {
  final DioClient dioClient;

  GetCandidateFamiliesInCompanyDataApi({required this.dioClient});

  Future<ResponseModel<ResponseFamiliesData>> getCandidateFamiliesInCompanyData(
      int candidateId) async {
    Map<String, dynamic> data = {"candidateId": candidateId};

    return await makeGetRequestWithResponseModel(
        dioClient.dio.get(
          ServiceUrl.getListFamilyData,
          queryParameters: data,
        ),
        ResponseFamiliesData.fromJson);
  }


}
