// To parse this JSON data, do
//
//     final workExperienceReinstance = workExperienceReinstanceFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'work_experience_reinstance.g.dart';

WorkExperienceReinstance workExperienceReinstanceFromJson(String str) => WorkExperienceReinstance.fromJson(json.decode(str));

String workExperienceReinstanceToJson(WorkExperienceReinstance data) => json.encode(data.toJson());

@JsonSerializable()
class WorkExperienceReinstance {
  @JsonKey(name: "reinstateOfficeCode")
  String? reinstateOfficeCode;
  @JsonKey(name: "reinstateLeaderName")
  String? reinstateLeaderName;
  @JsonKey(name: "reinstateLastPosition")
  String? reinstateLastPosition;
  @JsonKey(name: "reinstateStatus")
  dynamic reinstateStatus;
  @JsonKey(name: "reinstateAgentCode")
  dynamic reinstateAgentCode;
  @JsonKey(name: "isReinstate")
  String? isReinstate;

  WorkExperienceReinstance({
    this.reinstateOfficeCode,
    this.reinstateLeaderName,
    this.reinstateLastPosition,
    this.reinstateStatus,
    this.reinstateAgentCode,
    this.isReinstate,
  });

  WorkExperienceReinstance copyWith({
    String? reinstateOfficeCode,
    String? reinstateLeaderName,
    String? reinstateLastPosition,
    dynamic reinstateStatus,
    dynamic reinstateAgentCode,
    String? isReinstate,
  }) =>
      WorkExperienceReinstance(
        reinstateOfficeCode: reinstateOfficeCode ?? this.reinstateOfficeCode,
        reinstateLeaderName: reinstateLeaderName ?? this.reinstateLeaderName,
        reinstateLastPosition: reinstateLastPosition ?? this.reinstateLastPosition,
        reinstateStatus: reinstateStatus ?? this.reinstateStatus,
        reinstateAgentCode: reinstateAgentCode ?? this.reinstateAgentCode,
        isReinstate: isReinstate ?? this.isReinstate,
      );

  factory WorkExperienceReinstance.fromJson(Map<String, dynamic> json) => _$WorkExperienceReinstanceFromJson(json);

  Map<String, dynamic> toJson() => _$WorkExperienceReinstanceToJson(this);
}
