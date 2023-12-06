// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateModel _$CandidateModelFromJson(Map<String, dynamic> json) =>
    CandidateModel(
      id: json['id'] as String?,
      userId: json['userID'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'],
      lastName: json['lastName'] as String?,
      dob: json['dob'] as String?,
      createDate: json['createDate'] as String?,
      isSubmission: json['isSubmission'] as String?,
      isCompleted: json['isCompleted'] as String?,
      agentCode: json['agentCode'],
      submissionDate: json['submissionDate'],
      finalAgreementStatus: json['finalAgreementStatus'] as String?,
    );

Map<String, dynamic> _$CandidateModelToJson(CandidateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userId,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'dob': instance.dob,
      'createDate': instance.createDate,
      'isSubmission': instance.isSubmission,
      'isCompleted': instance.isCompleted,
      'agentCode': instance.agentCode,
      'submissionDate': instance.submissionDate,
      'finalAgreementStatus': instance.finalAgreementStatus,
    };
