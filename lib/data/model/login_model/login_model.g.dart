// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      username: json['username'] as String?,
      lastAuthenticated: json['lastAuthenticated'] as String?,
      invalidPasswordAttempts: json['invalidPasswordAttempts'] as int?,
      appointmentDate: json['appointmentDate'] as String?,
      isAcl: json['isACL'] as String?,
      modifiersName: json['modifiersName'] as String?,
      name: json['name'] as String?,
      acceptAgreement: json['acceptAgreement'] as String?,
      faultLogin: json['faultLogin'] as int?,
      uid: json['uid'] as String?,
      employeeNumber: json['employeeNumber'] as String?,
      createTimestamp: json['createTimestamp'] as String?,
      lastLoginDate: json['lastLoginDate'] as String?,
      isHold: json['isHold'] as String?,
      autoGroupsAdded: json['autoGroupsAdded'] as String?,
      shadowFlag: json['shadowFlag'] as String?,
      creatorName: json['creatorName'] as String?,
      shadowExpire: json['shadowExpire'] as String?,
      group:
          (json['group'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'lastAuthenticated': instance.lastAuthenticated,
      'invalidPasswordAttempts': instance.invalidPasswordAttempts,
      'appointmentDate': instance.appointmentDate,
      'isACL': instance.isAcl,
      'modifiersName': instance.modifiersName,
      'name': instance.name,
      'acceptAgreement': instance.acceptAgreement,
      'faultLogin': instance.faultLogin,
      'uid': instance.uid,
      'employeeNumber': instance.employeeNumber,
      'createTimestamp': instance.createTimestamp,
      'lastLoginDate': instance.lastLoginDate,
      'isHold': instance.isHold,
      'autoGroupsAdded': instance.autoGroupsAdded,
      'shadowFlag': instance.shadowFlag,
      'creatorName': instance.creatorName,
      'shadowExpire': instance.shadowExpire,
      'group': instance.group,
    };
