// To parse this JSON data, do
//
//     final familyCardModel = familyCardModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'family_card_model.g.dart';

FamilyCardModel familyCardModelFromJson(String str) => FamilyCardModel.fromJson(json.decode(str));

String familyCardModelToJson(FamilyCardModel data) => json.encode(data.toJson());

@JsonSerializable()
class FamilyCardModel {
  @JsonKey(name: "candidateId")
  String? candidateId;
  @JsonKey(name: "familyCardNo")
  String? familyCardNo;
  @JsonKey(name: "familyDetails")
  List<FamilyDetail>? familyDetails;

  FamilyCardModel({
    this.candidateId,
    this.familyCardNo,
    this.familyDetails,
  });

  FamilyCardModel copyWith({
    String? candidateId,
    String? familyCardNo,
    List<FamilyDetail>? familyDetails,
  }) =>
      FamilyCardModel(
        candidateId: candidateId ?? this.candidateId,
        familyCardNo: familyCardNo ?? this.familyCardNo,
        familyDetails: familyDetails ?? this.familyDetails,
      );

  factory FamilyCardModel.fromJson(Map<String, dynamic> json) => _$FamilyCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyCardModelToJson(this);
}

@JsonSerializable()
class FamilyDetail {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "idCardNo")
  String? idCardNo;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "middleName")
  dynamic middleName;
  @JsonKey(name: "lastName")
  dynamic lastName;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "dateOfBirth")
  String? dateOfBirth;
  @JsonKey(name: "relation")
  String? relation;
  @JsonKey(name: "status")
  String? status;

  FamilyDetail({
    this.id,
    this.idCardNo,
    this.firstName,
    this.middleName,
    this.lastName,
    this.gender,
    this.dateOfBirth,
    this.relation,
    this.status,
  });

  FamilyDetail copyWith({
    int? id,
    String? idCardNo,
    String? firstName,
    dynamic middleName,
    dynamic lastName,
    String? gender,
    String? dateOfBirth,
    String? relation,
    String? status,
  }) =>
      FamilyDetail(
        id: id ?? this.id,
        idCardNo: idCardNo ?? this.idCardNo,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        relation: relation ?? this.relation,
        status: status ?? this.status,
      );

  factory FamilyDetail.fromJson(Map<String, dynamic> json) => _$FamilyDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyDetailToJson(this);
}
