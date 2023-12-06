// To parse this JSON data, do
//
//     final agentModel = agentModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'candidate_model.g.dart';

CandidateModel candidateModelFromJson(String str) => CandidateModel.fromJson(json.decode(str));

String candidateModelToJson(CandidateModel data) => json.encode(data.toJson());

@JsonSerializable()
class CandidateModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "userID")
  String? userId;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "middleName")
  dynamic middleName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "dob")
  String? dob;
  @JsonKey(name: "createDate")
  String? createDate;
  @JsonKey(name: "isSubmission")
  String? isSubmission;
  @JsonKey(name: "isCompleted")
  String? isCompleted;
  @JsonKey(name: "agentCode")
  dynamic agentCode;
  @JsonKey(name: "submissionDate")
  dynamic submissionDate;
  @JsonKey(name: "finalAgreementStatus")
  String? finalAgreementStatus;

  CandidateModel({
    this.id,
    this.userId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.dob,
    this.createDate,
    this.isSubmission,
    this.isCompleted,
    this.agentCode,
    this.submissionDate,
    this.finalAgreementStatus,
  });

  CandidateModel copyWith({
    String? id,
    String? userId,
    String? firstName,
    dynamic middleName,
    String? lastName,
    String? dob,
    String? createDate,
    String? isSubmission,
    String? isCompleted,
    dynamic agentCode,
    dynamic submissionDate,
    String? finalAgreementStatus,
  }) =>
      CandidateModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        dob: dob ?? this.dob,
        createDate: createDate ?? this.createDate,
        isSubmission: isSubmission ?? this.isSubmission,
        isCompleted: isCompleted ?? this.isCompleted,
        agentCode: agentCode ?? this.agentCode,
        submissionDate: submissionDate ?? this.submissionDate,
        finalAgreementStatus: finalAgreementStatus ?? this.finalAgreementStatus,
      );

  factory CandidateModel.fromJson(Map<String, dynamic> json) => _$CandidateModelFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateModelToJson(this);
}
