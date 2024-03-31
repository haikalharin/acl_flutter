// To parse this JSON data, do
//
//     final requestFamiliesData = requestFamiliesDataFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'request_families_data.g.dart';

RequestFamiliesData requestFamiliesDataFromJson(String str) => RequestFamiliesData.fromJson(json.decode(str));

String requestFamiliesDataToJson(RequestFamiliesData data) => json.encode(data.toJson());

@JsonSerializable()
class RequestFamiliesData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "candidateId")
  int? candidateId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "relation")
  String? relation;
  @JsonKey(name: "directName")
  String? directName;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "agentCode")
  String? agentCode;
  @JsonKey(name: "department")
  String? department;
  @JsonKey(name: "company")
  String? company;

  RequestFamiliesData({
    this.id,
    this.type,
    this.candidateId,
    this.name,
    this.relation,
    this.directName,
    this.role,
    this.agentCode,
    this.department,
    this.company,
  });

  RequestFamiliesData copyWith({
    int? id,
    String? type,
    int? candidateId,
    String? name,
    String? relation,
    String? directName,
    String? role,
    String? agentCode,
    String? department,
    String? company,
  }) =>
      RequestFamiliesData(
        id: id ?? this.id,
        type: type ?? this.type,
        candidateId: candidateId ?? this.candidateId,
        name: name ?? this.name,
        relation: relation ?? this.relation,
        directName: directName ?? this.directName,
        role: role ?? this.role,
        agentCode: agentCode ?? this.agentCode,
        department: department ?? this.department,
        company: company ?? this.company,
      );

  factory RequestFamiliesData.fromJson(Map<String, dynamic> json) => _$RequestFamiliesDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequestFamiliesDataToJson(this);
}
