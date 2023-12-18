// To parse this JSON data, do
//
//     final requestCandidateDocModel = requestCandidateDocModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'request_candidate_doc_model.g.dart';

RequestCandidateDocModel requestCandidateDocModelFromJson(String str) => RequestCandidateDocModel.fromJson(json.decode(str));

String requestCandidateDocModelToJson(RequestCandidateDocModel data) => json.encode(data.toJson());

@JsonSerializable()
class RequestCandidateDocModel {
  @JsonKey(name: "agentCode")
  String? agentCode;
  @JsonKey(name: "candidateId")
  String? candidateId;
  @JsonKey(name: "docType")
  String? docType;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "stringBase")
  String? stringBase;

  RequestCandidateDocModel({
    this.agentCode,
    this.candidateId,
    this.docType,
    this.name,
    this.stringBase,
  });

  RequestCandidateDocModel copyWith({
    String? agentCode,
    String? candidateId,
    String? docType,
    String? name,
    String? stringBase,
  }) =>
      RequestCandidateDocModel(
        agentCode: agentCode ?? this.agentCode,
        candidateId: candidateId ?? this.candidateId,
        docType: docType ?? this.docType,
        name: name ?? this.name,
        stringBase: stringBase ?? this.stringBase,
      );

  factory RequestCandidateDocModel.fromJson(Map<String, dynamic> json) => _$RequestCandidateDocModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestCandidateDocModelToJson(this);
}
