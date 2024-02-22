// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_candidate_doc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestCandidateDocModel _$RequestCandidateDocModelFromJson(
        Map<String, dynamic> json) =>
    RequestCandidateDocModel(
      agentCode: json['agentCode'] as String?,
      candidateId: json['candidateId'] as String?,
      docType: json['docType'] as String?,
      name: json['name'] as String?,
      stringBase: json['stringBase'] as String?,
    );

Map<String, dynamic> _$RequestCandidateDocModelToJson(
        RequestCandidateDocModel instance) =>
    <String, dynamic>{
      'agentCode': instance.agentCode,
      'candidateId': instance.candidateId,
      'docType': instance.docType,
      'name': instance.name,
      'stringBase': instance.stringBase,
    };
