// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

@JsonSerializable()
class NotificationModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "alert")
  String? alert;
  @JsonKey(name: "payload")
  String? payload;
  @JsonKey(name: "opened")
  String? opened;
  @JsonKey(name: "createDate")
  String? createDate;

  NotificationModel({
    this.id,
    this.alert,
    this.payload,
    this.opened,
    this.createDate,
  });

  NotificationModel copyWith({
    int? id,
    String? alert,
    String? payload,
    String? opened,
    String? createDate,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        alert: alert ?? this.alert,
        payload: payload ?? this.payload,
        opened: opened ?? this.opened,
        createDate: createDate ?? this.createDate,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
