// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_be_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateBeModel _$CandidateBeModelFromJson(Map<String, dynamic> json) =>
    CandidateBeModel(
      id: json['id'] as int?,
      userId: json['userId'] as String?,
      startDate: json['startDate'] as String?,
      reviewDate: json['reviewDate'] as String?,
      notificationId: json['notificationId'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'],
      lastName: json['lastName'] as String?,
      dob: json['dob'] as String?,
      isSubmission: json['isSubmission'] as String?,
      isCompleted: json['isCompleted'] as String?,
      agentCode: json['agentCode'] as String?,
      isReview: json['isReview'] as String?,
    );

Map<String, dynamic> _$CandidateBeModelToJson(CandidateBeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'startDate': instance.startDate,
      'reviewDate': instance.reviewDate,
      'notificationId': instance.notificationId,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'dob': instance.dob,
      'isSubmission': instance.isSubmission,
      'isCompleted': instance.isCompleted,
      'agentCode': instance.agentCode,
      'isReview': instance.isReview,
    };
