// To parse this JSON data, do
//
//     final educationCandidateModel = educationCandidateModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'education_candidate_model.g.dart';

EducationCandidateModel educationCandidateModelFromJson(String str) => EducationCandidateModel.fromJson(json.decode(str));

String educationCandidateModelToJson(EducationCandidateModel data) => json.encode(data.toJson());

@JsonSerializable()
class EducationCandidateModel {
  @JsonKey(name: "candidateID")
  String? candidateId;
  @JsonKey(name: "educationName")
  String? educationName;
  @JsonKey(name: "startDate")
  String? startDate;
  @JsonKey(name: "endDate")
  String? endDate;
  @JsonKey(name: "educationStatus")
  String? educationStatus;
  @JsonKey(name: "educationDescription")
  String? educationDescription;
  @JsonKey(name: "educationType")
  String? educationType;

  EducationCandidateModel({
    this.candidateId,
    this.educationName,
    this.startDate,
    this.endDate,
    this.educationStatus,
    this.educationDescription,
    this.educationType,
  });

  EducationCandidateModel copyWith({
    String? candidateId,
    String? educationName,
    String? startDate,
    String? endDate,
    String? educationStatus,
    String? educationDescription,
    String? educationType,
  }) =>
      EducationCandidateModel(
        candidateId: candidateId ?? this.candidateId,
        educationName: educationName ?? this.educationName,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        educationStatus: educationStatus ?? this.educationStatus,
        educationDescription: educationDescription ?? this.educationDescription,
        educationType: educationType ?? this.educationType,
      );

  factory EducationCandidateModel.fromJson(Map<String, dynamic> json) => _$EducationCandidateModelFromJson(json);

  Map<String, dynamic> toJson() => _$EducationCandidateModelToJson(this);
}
