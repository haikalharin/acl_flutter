// To parse this JSON data, do
//
//     final responseFamiliesData = responseFamiliesDataFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'response_families_data.g.dart';

ResponseFamiliesData responseFamiliesDataFromJson(String str) => ResponseFamiliesData.fromJson(json.decode(str));

String responseFamiliesDataToJson(ResponseFamiliesData data) => json.encode(data.toJson());

@JsonSerializable()
class ResponseFamiliesData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "candidateId")
  int? candidateId;
  @JsonKey(name: "type")
  String? type;
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
  @JsonKey(name: "companyGroup")
  dynamic companyGroup;
  @JsonKey(name: "companyInsurance")
  dynamic companyInsurance;
  @JsonKey(name: "department")
  dynamic department;
  @JsonKey(name: "createDate")
  String? createDate;
  @JsonKey(name: "updateDate")
  dynamic updateDate;

  ResponseFamiliesData({
    this.id,
    this.candidateId,
    this.type,
    this.name,
    this.relation,
    this.directName,
    this.role,
    this.agentCode,
    this.companyGroup,
    this.companyInsurance,
    this.department,
    this.createDate,
    this.updateDate,
  });

  ResponseFamiliesData copyWith({
    int? id,
    int? candidateId,
    String? type,
    String? name,
    String? relation,
    String? directName,
    String? role,
    String? agentCode,
    dynamic companyGroup,
    dynamic companyInsurance,
    dynamic department,
    String? createDate,
    dynamic updateDate,
  }) =>
      ResponseFamiliesData(
        id: id ?? this.id,
        candidateId: candidateId ?? this.candidateId,
        type: type ?? this.type,
        name: name ?? this.name,
        relation: relation ?? this.relation,
        directName: directName ?? this.directName,
        role: role ?? this.role,
        agentCode: agentCode ?? this.agentCode,
        companyGroup: companyGroup ?? this.companyGroup,
        companyInsurance: companyInsurance ?? this.companyInsurance,
        department: department ?? this.department,
        createDate: createDate ?? this.createDate,
        updateDate: updateDate ?? this.updateDate,
      );

  factory ResponseFamiliesData.fromJson(Map<String, dynamic> json) => _$ResponseFamiliesDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseFamiliesDataToJson(this);
}
