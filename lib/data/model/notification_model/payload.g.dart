// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      subject: json['subject'] as String?,
      detail: json['detail'] as String?,
      message: json['message'],
      completedSc: json['completedSC'] as bool?,
      candidateId: json['candidateId'] as int?,
      userId: json['userID'] as String?,
    );

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'data': instance.data,
      'subject': instance.subject,
      'detail': instance.detail,
      'message': instance.message,
      'completedSC': instance.completedSc,
      'candidateId': instance.candidateId,
      'userID': instance.userId,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      pribadi:
          (json['pribadi'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'pribadi': instance.pribadi,
    };
