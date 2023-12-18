// To parse this JSON data, do
//
//     final requestSepouseModel = requestSepouseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'request_sepouse_model.g.dart';

RequestSepouseModel requestSepouseModelFromJson(String str) => RequestSepouseModel.fromJson(json.decode(str));

String requestSepouseModelToJson(RequestSepouseModel data) => json.encode(data.toJson());

@JsonSerializable()
class RequestSepouseModel {
  @JsonKey(name: "candidateId")
  String? candidateId;
  @JsonKey(name: "familyCardNo")
  String? familyCardNo;
  @JsonKey(name: "familyDetails")
  List<FamilyDetail>? familyDetails;

  RequestSepouseModel({
    this.candidateId,
    this.familyCardNo,
    this.familyDetails,
  });

  RequestSepouseModel copyWith({
    String? candidateId,
    String? familyCardNo,
    List<FamilyDetail>? familyDetails,
  }) =>
      RequestSepouseModel(
        candidateId: candidateId ?? this.candidateId,
        familyCardNo: familyCardNo ?? this.familyCardNo,
        familyDetails: familyDetails ?? this.familyDetails,
      );

  factory RequestSepouseModel.fromJson(Map<String, dynamic> json) => _$RequestSepouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestSepouseModelToJson(this);
}

@JsonSerializable()
class FamilyDetail {
  @JsonKey(name: "idCardNo")
  String? idCardNo;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "relation")
  String? relation;
  @JsonKey(name: "dateOfBirth")
  String? dateOfBirth;

  FamilyDetail({
    this.idCardNo,
    this.firstName,
    this.gender,
    this.relation,
    this.dateOfBirth,
  });

  FamilyDetail copyWith({
    String? idCardNo,
    String? firstName,
    String? gender,
    String? relation,
    String? dateOfBirth,
  }) =>
      FamilyDetail(
        idCardNo: idCardNo ?? this.idCardNo,
        firstName: firstName ?? this.firstName,
        gender: gender ?? this.gender,
        relation: relation ?? this.relation,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      );

  factory FamilyDetail.fromJson(Map<String, dynamic> json) => _$FamilyDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyDetailToJson(this);
}
