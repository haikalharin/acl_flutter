// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

@JsonSerializable()
class LoginModel {
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "lastAuthenticated")
  String? lastAuthenticated;
  @JsonKey(name: "invalidPasswordAttempts")
  int? invalidPasswordAttempts;
  @JsonKey(name: "appointmentDate")
  String? appointmentDate;
  @JsonKey(name: "isACL")
  String? isAcl;
  @JsonKey(name: "modifiersName")
  String? modifiersName;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "acceptAgreement")
  String? acceptAgreement;
  @JsonKey(name: "faultLogin")
  int? faultLogin;
  @JsonKey(name: "uid")
  String? uid;
  @JsonKey(name: "employeeNumber")
  String? employeeNumber;
  @JsonKey(name: "createTimestamp")
  String? createTimestamp;
  @JsonKey(name: "lastLoginDate")
  String? lastLoginDate;
  @JsonKey(name: "isHold")
  String? isHold;
  @JsonKey(name: "autoGroupsAdded")
  String? autoGroupsAdded;
  @JsonKey(name: "shadowFlag")
  String? shadowFlag;
  @JsonKey(name: "creatorName")
  String? creatorName;
  @JsonKey(name: "shadowExpire")
  String? shadowExpire;
  @JsonKey(name: "group")
  List<String>? group;

  LoginModel({
    this.username,
    this.lastAuthenticated,
    this.invalidPasswordAttempts,
    this.appointmentDate,
    this.isAcl,
    this.modifiersName,
    this.name,
    this.acceptAgreement,
    this.faultLogin,
    this.uid,
    this.employeeNumber,
    this.createTimestamp,
    this.lastLoginDate,
    this.isHold,
    this.autoGroupsAdded,
    this.shadowFlag,
    this.creatorName,
    this.shadowExpire,
    this.group,
  });

  LoginModel copyWith({
    String? username,
    String? lastAuthenticated,
    int? invalidPasswordAttempts,
    String? appointmentDate,
    String? isAcl,
    String? modifiersName,
    String? name,
    String? acceptAgreement,
    int? faultLogin,
    String? uid,
    String? employeeNumber,
    String? createTimestamp,
    String? lastLoginDate,
    String? isHold,
    String? autoGroupsAdded,
    String? shadowFlag,
    String? creatorName,
    String? shadowExpire,
    List<String>? group,
  }) =>
      LoginModel(
        username: username ?? this.username,
        lastAuthenticated: lastAuthenticated ?? this.lastAuthenticated,
        invalidPasswordAttempts: invalidPasswordAttempts ?? this.invalidPasswordAttempts,
        appointmentDate: appointmentDate ?? this.appointmentDate,
        isAcl: isAcl ?? this.isAcl,
        modifiersName: modifiersName ?? this.modifiersName,
        name: name ?? this.name,
        acceptAgreement: acceptAgreement ?? this.acceptAgreement,
        faultLogin: faultLogin ?? this.faultLogin,
        uid: uid ?? this.uid,
        employeeNumber: employeeNumber ?? this.employeeNumber,
        createTimestamp: createTimestamp ?? this.createTimestamp,
        lastLoginDate: lastLoginDate ?? this.lastLoginDate,
        isHold: isHold ?? this.isHold,
        autoGroupsAdded: autoGroupsAdded ?? this.autoGroupsAdded,
        shadowFlag: shadowFlag ?? this.shadowFlag,
        creatorName: creatorName ?? this.creatorName,
        shadowExpire: shadowExpire ?? this.shadowExpire,
        group: group ?? this.group,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
