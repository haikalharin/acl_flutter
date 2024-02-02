// To parse this JSON data, do
//
//     final addCandidateWorkExperienceModel = addCandidateWorkExperienceModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'add_candidate_work_experience_model.g.dart';

AddCandidateWorkExperienceModel addCandidateWorkExperienceModelFromJson(String str) => AddCandidateWorkExperienceModel.fromJson(json.decode(str));

String addCandidateWorkExperienceModelToJson(AddCandidateWorkExperienceModel data) => json.encode(data.toJson());

@JsonSerializable()
class AddCandidateWorkExperienceModel {
  @JsonKey(name: "candidateID")
  String? candidateId;
  @JsonKey(name: "companyName")
  String? companyName;
  @JsonKey(name: "startDate")
  String? startDate;
  @JsonKey(name: "endDate")
  String? endDate;
  @JsonKey(name: "jobDescription")
  String? jobDescription;
  @JsonKey(name: "companyType")
  String? companyType;

  AddCandidateWorkExperienceModel({
    this.candidateId,
    this.companyName,
    this.startDate,
    this.endDate,
    this.jobDescription,
    this.companyType,
  });

  AddCandidateWorkExperienceModel copyWith({
    String? candidateId,
    String? companyName,
    String? startDate,
    String? endDate,
    String? jobDescription,
    String? companyType,
  }) =>
      AddCandidateWorkExperienceModel(
        candidateId: candidateId ?? this.candidateId,
        companyName: companyName ?? this.companyName,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        jobDescription: jobDescription ?? this.jobDescription,
        companyType: companyType ?? this.companyType,
      );

  factory AddCandidateWorkExperienceModel.fromJson(Map<String, dynamic> json) => _$AddCandidateWorkExperienceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCandidateWorkExperienceModelToJson(this);
}
