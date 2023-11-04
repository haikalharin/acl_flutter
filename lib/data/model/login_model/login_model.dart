// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

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

  LoginModel({
    this.username,
    this.lastAuthenticated,
    this.invalidPasswordAttempts,
  });

  LoginModel copyWith({
    String? username,
    String? lastAuthenticated,
    int? invalidPasswordAttempts,
  }) =>
      LoginModel(
        username: username ?? this.username,
        lastAuthenticated: lastAuthenticated ?? this.lastAuthenticated,
        invalidPasswordAttempts: invalidPasswordAttempts ?? this.invalidPasswordAttempts,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
