// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_candidate_work_experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCandidateWorkExperienceModel _$AddCandidateWorkExperienceModelFromJson(
        Map<String, dynamic> json) =>
    AddCandidateWorkExperienceModel(
      candidateId: json['candidateID'] as String?,
      companyName: json['companyName'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      jobDescription: json['jobDescription'] as String?,
      companyType: json['companyType'] as String?,
    );

Map<String, dynamic> _$AddCandidateWorkExperienceModelToJson(
        AddCandidateWorkExperienceModel instance) =>
    <String, dynamic>{
      'candidateID': instance.candidateId,
      'companyName': instance.companyName,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'jobDescription': instance.jobDescription,
      'companyType': instance.companyType,
    };
