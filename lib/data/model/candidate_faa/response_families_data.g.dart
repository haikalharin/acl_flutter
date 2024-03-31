// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_families_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseFamiliesData _$ResponseFamiliesDataFromJson(
        Map<String, dynamic> json) =>
    ResponseFamiliesData(
      id: json['id'] as int?,
      candidateId: json['candidateId'] as int?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      relation: json['relation'] as String?,
      directName: json['directName'] as String?,
      role: json['role'] as String?,
      agentCode: json['agentCode'] as String?,
      companyGroup: json['companyGroup'],
      companyInsurance: json['companyInsurance'],
      department: json['department'],
      createDate: json['createDate'] as String?,
      updateDate: json['updateDate'],
    );

Map<String, dynamic> _$ResponseFamiliesDataToJson(
        ResponseFamiliesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'candidateId': instance.candidateId,
      'type': instance.type,
      'name': instance.name,
      'relation': instance.relation,
      'directName': instance.directName,
      'role': instance.role,
      'agentCode': instance.agentCode,
      'companyGroup': instance.companyGroup,
      'companyInsurance': instance.companyInsurance,
      'department': instance.department,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
    };
