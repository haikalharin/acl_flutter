import 'package:acl_flutter/data/model/candidate_faa/family_card_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/service_url.dart';
import '../../model/candidate/candidate_data_model.dart';

class GetCandidateFamilyDataApi with ApiHelper<FamilyCardModel> {
  final DioClient dioClient;

  GetCandidateFamilyDataApi({required this.dioClient});

  Future<ResponseModel<FamilyCardModel>> getCandidateFamilyData(
      String candidateId) async {
    Map<String, dynamic> data = {"candidateId": candidateId};

    return await makeGetRequestWithResponseModel(
        dioClient.dio.post(
          ServiceUrl.getCandidateFamilyData,
          data: data,
        ),
        FamilyCardModel.fromJson);
  }


}
