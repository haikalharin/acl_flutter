// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as int?,
      alert: json['alert'] as String?,
      payload: json['payload'] as String?,
      opened: json['opened'] as String?,
      createDate: json['createDate'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alert': instance.alert,
      'payload': instance.payload,
      'opened': instance.opened,
      'createDate': instance.createDate,
    };
