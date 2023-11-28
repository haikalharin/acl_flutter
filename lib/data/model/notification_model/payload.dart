// To parse this JSON data, do
//
//     final payload = payloadFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'payload.g.dart';

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

String payloadToJson(Payload data) => json.encode(data.toJson());

@JsonSerializable()
class Payload {
  @JsonKey(name: "data")
  Data? data;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "detail")
  String? detail;
  @JsonKey(name: "message")
  dynamic message;
  @JsonKey(name: "completedSC")
  bool? completedSc;
  @JsonKey(name: "candidateId")
  int? candidateId;
  @JsonKey(name: "userID")
  String? userId;

  Payload({
    this.data,
    this.subject,
    this.detail,
    this.message,
    this.completedSc,
    this.candidateId,
    this.userId,
  });

  Payload copyWith({
    Data? data,
    String? subject,
    String? detail,
    dynamic message,
    bool? completedSc,
    int? candidateId,
    String? userId,
  }) =>
      Payload(
        data: data ?? this.data,
        subject: subject ?? this.subject,
        detail: detail ?? this.detail,
        message: message ?? this.message,
        completedSc: completedSc ?? this.completedSc,
        candidateId: candidateId ?? this.candidateId,
        userId: userId ?? this.userId,
      );

  factory Payload.fromJson(Map<String, dynamic> json) => _$PayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "pribadi")
  List<String>? pribadi;

  Data({
    this.pribadi,
  });

  Data copyWith({
    List<String>? pribadi,
  }) =>
      Data(
        pribadi: pribadi ?? this.pribadi,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
