// To parse this JSON data, do
//
//     final agentBeModel = agentBeModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'agent_be_model.g.dart';

AgentBeModel agentBeModelFromJson(String str) => AgentBeModel.fromJson(json.decode(str));

String agentBeModelToJson(AgentBeModel data) => json.encode(data.toJson());

@JsonSerializable()
class AgentBeModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "userId")
  String? userId;
  @JsonKey(name: "startDate")
  String? startDate;
  @JsonKey(name: "reviewDate")
  String? reviewDate;
  @JsonKey(name: "notificationId")
  String? notificationId;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "middleName")
  dynamic middleName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "dob")
  String? dob;
  @JsonKey(name: "isSubmission")
  String? isSubmission;
  @JsonKey(name: "isCompleted")
  String? isCompleted;
  @JsonKey(name: "agentCode")
  String? agentCode;
  @JsonKey(name: "isReview")
  String? isReview;

  AgentBeModel({
    this.id,
    this.userId,
    this.startDate,
    this.reviewDate,
    this.notificationId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.dob,
    this.isSubmission,
    this.isCompleted,
    this.agentCode,
    this.isReview,
  });

  AgentBeModel copyWith({
    int? id,
    String? userId,
    String? startDate,
    String? reviewDate,
    String? notificationId,
    String? firstName,
    dynamic middleName,
    String? lastName,
    String? dob,
    String? isSubmission,
    String? isCompleted,
    String? agentCode,
    String? isReview,
  }) =>
      AgentBeModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        startDate: startDate ?? this.startDate,
        reviewDate: reviewDate ?? this.reviewDate,
        notificationId: notificationId ?? this.notificationId,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        dob: dob ?? this.dob,
        isSubmission: isSubmission ?? this.isSubmission,
        isCompleted: isCompleted ?? this.isCompleted,
        agentCode: agentCode ?? this.agentCode,
        isReview: isReview ?? this.isReview,
      );

  factory AgentBeModel.fromJson(Map<String, dynamic> json) => _$AgentBeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AgentBeModelToJson(this);
}
