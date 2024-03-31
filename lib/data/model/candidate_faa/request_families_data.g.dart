// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_families_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestFamiliesData _$RequestFamiliesDataFromJson(Map<String, dynamic> json) =>
    RequestFamiliesData(
      id: json['id'] as int?,
      type: json['type'] as String?,
      candidateId: json['candidateId'] as int?,
      name: json['name'] as String?,
      relation: json['relation'] as String?,
      directName: json['directName'] as String?,
      role: json['role'] as String?,
      agentCode: json['agentCode'] as String?,
      department: json['department'] as String?,
      company: json['company'] as String?,
    );

Map<String, dynamic> _$RequestFamiliesDataToJson(
        RequestFamiliesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'candidateId': instance.candidateId,
      'name': instance.name,
      'relation': instance.relation,
      'directName': instance.directName,
      'role': instance.role,
      'agentCode': instance.agentCode,
      'department': instance.department,
      'company': instance.company,
    };
