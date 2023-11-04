// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      username: json['username'] as String?,
      lastAuthenticated: json['lastAuthenticated'] as String?,
      invalidPasswordAttempts: json['invalidPasswordAttempts'] as int?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'lastAuthenticated': instance.lastAuthenticated,
      'invalidPasswordAttempts': instance.invalidPasswordAttempts,
    };
