// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_experience_reinstance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkExperienceReinstance _$WorkExperienceReinstanceFromJson(
        Map<String, dynamic> json) =>
    WorkExperienceReinstance(
      reinstateOfficeCode: json['reinstateOfficeCode'] as String?,
      reinstateLeaderName: json['reinstateLeaderName'] as String?,
      reinstateLastPosition: json['reinstateLastPosition'] as String?,
      reinstateStatus: json['reinstateStatus'],
      reinstateAgentCode: json['reinstateAgentCode'],
      isReinstate: json['isReinstate'] as String?,
    );

Map<String, dynamic> _$WorkExperienceReinstanceToJson(
        WorkExperienceReinstance instance) =>
    <String, dynamic>{
      'reinstateOfficeCode': instance.reinstateOfficeCode,
      'reinstateLeaderName': instance.reinstateLeaderName,
      'reinstateLastPosition': instance.reinstateLastPosition,
      'reinstateStatus': instance.reinstateStatus,
      'reinstateAgentCode': instance.reinstateAgentCode,
      'isReinstate': instance.isReinstate,
    };
