// To parse this JSON data, do
//
//     final candidateRegisterModel = candidateRegisterModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'candidate_register_model.g.dart';

CandidateRegisterModel candidateRegisterModelFromJson(String str) => CandidateRegisterModel.fromJson(json.decode(str));

String candidateRegisterModelToJson(CandidateRegisterModel data) => json.encode(data.toJson());

@JsonSerializable()
class CandidateRegisterModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "userId")
  String? userId;

  CandidateRegisterModel({
    this.id,
    this.userId,
  });

  CandidateRegisterModel copyWith({
    int? id,
    String? userId,
  }) =>
      CandidateRegisterModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
      );

  factory CandidateRegisterModel.fromJson(Map<String, dynamic> json) => _$CandidateRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateRegisterModelToJson(this);
}
