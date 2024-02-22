// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_candidate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationCandidateModel _$EducationCandidateModelFromJson(
        Map<String, dynamic> json) =>
    EducationCandidateModel(
      candidateId: json['candidateID'] as String?,
      educationName: json['educationName'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      educationStatus: json['educationStatus'] as String?,
      educationDescription: json['educationDescription'] as String?,
      educationType: json['educationType'] as String?,
    );

Map<String, dynamic> _$EducationCandidateModelToJson(
        EducationCandidateModel instance) =>
    <String, dynamic>{
      'candidateID': instance.candidateId,
      'educationName': instance.educationName,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'educationStatus': instance.educationStatus,
      'educationDescription': instance.educationDescription,
      'educationType': instance.educationType,
    };
