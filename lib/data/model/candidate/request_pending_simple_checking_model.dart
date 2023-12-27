// To parse this JSON data, do
//
//     final requestPendingSimpleCheckingModel = requestPendingSimpleCheckingModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'request_pending_simple_checking_model.g.dart';

RequestPendingSimpleCheckingModel requestPendingSimpleCheckingModelFromJson(String str) => RequestPendingSimpleCheckingModel.fromJson(json.decode(str));

String requestPendingSimpleCheckingModelToJson(RequestPendingSimpleCheckingModel data) => json.encode(data.toJson());

@JsonSerializable()
class RequestPendingSimpleCheckingModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "middleName")
  String? middleName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "dob")
  String? dob;
  @JsonKey(name: "address1")
  String? address1;
  @JsonKey(name: "address2")
  String? address2;
  @JsonKey(name: "address3")
  String? address3;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "province")
  String? province;
  @JsonKey(name: "zipCode")
  String? zipCode;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "officeCode")
  String? officeCode;
  @JsonKey(name: "officeCity")
  String? officeCity;
  @JsonKey(name: "leaderName")
  String? leaderName;
  @JsonKey(name: "leaderAgentCode")
  String? leaderAgentCode;
  @JsonKey(name: "spouseIDCardNo")
  String? spouseIdCardNo;
  @JsonKey(name: "idCardNo")
  String? idCardNo;
  @JsonKey(name: "occupation")
  String? occupation;
  @JsonKey(name: "occupationOther")
  String? occupationOther;
  @JsonKey(name: "aajiNo")
  String? aajiNo;
  @JsonKey(name: "aajiActiveFlag")
  String? aajiActiveFlag;
  @JsonKey(name: "prevCompany")
  String? prevCompany;
  @JsonKey(name: "prevCompanyOthers")
  String? prevCompanyOthers;
  @JsonKey(name: "idFamilyCardNo")
  String? idFamilyCardNo;
  @JsonKey(name: "aasiNo")
  String? aasiNo;
  @JsonKey(name: "aasiActiveFlag")
  String? aasiActiveFlag;
  @JsonKey(name: "prevCompanyAasi")
  String? prevCompanyAasi;
  @JsonKey(name: "aauiNo")
  String? aauiNo;
  @JsonKey(name: "aauiActiveFlag")
  String? aauiActiveFlag;
  @JsonKey(name: "prevCompanyAaui")
  String? prevCompanyAaui;
  @JsonKey(name: "aauiExpired")
  String? aauiExpired;

  RequestPendingSimpleCheckingModel({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.dob,
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.province,
    this.zipCode,
    this.country,
    this.officeCode,
    this.officeCity,
    this.leaderName,
    this.leaderAgentCode,
    this.spouseIdCardNo,
    this.idCardNo,
    this.occupation,
    this.occupationOther,
    this.aajiNo,
    this.aajiActiveFlag,
    this.prevCompany,
    this.prevCompanyOthers,
    this.idFamilyCardNo,
    this.aasiNo,
    this.aasiActiveFlag,
    this.prevCompanyAasi,
    this.aauiNo,
    this.aauiActiveFlag,
    this.prevCompanyAaui,
    this.aauiExpired,
  });

  RequestPendingSimpleCheckingModel copyWith({
    String? id,
    String? firstName,
    String? middleName,
    String? lastName,
    String? dob,
    String? address1,
    String? address2,
    String? address3,
    String? city,
    String? province,
    String? zipCode,
    String? country,
    String? officeCode,
    String? officeCity,
    String? leaderName,
    String? leaderAgentCode,
    String? spouseIdCardNo,
    String? idCardNo,
    String? occupation,
    String? occupationOther,
    String? aajiNo,
    String? aajiActiveFlag,
    String? prevCompany,
    String? prevCompanyOthers,
    String? idFamilyCardNo,
    String? aasiNo,
    String? aasiActiveFlag,
    String? prevCompanyAasi,
    String? aauiNo,
    String? aauiActiveFlag,
    String? prevCompanyAaui,
    String? aauiExpired,
  }) =>
      RequestPendingSimpleCheckingModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        dob: dob ?? this.dob,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        address3: address3 ?? this.address3,
        city: city ?? this.city,
        province: province ?? this.province,
        zipCode: zipCode ?? this.zipCode,
        country: country ?? this.country,
        officeCode: officeCode ?? this.officeCode,
        officeCity: officeCity ?? this.officeCity,
        leaderName: leaderName ?? this.leaderName,
        leaderAgentCode: leaderAgentCode ?? this.leaderAgentCode,
        spouseIdCardNo: spouseIdCardNo ?? this.spouseIdCardNo,
        idCardNo: idCardNo ?? this.idCardNo,
        occupation: occupation ?? this.occupation,
        occupationOther: occupationOther ?? this.occupationOther,
        aajiNo: aajiNo ?? this.aajiNo,
        aajiActiveFlag: aajiActiveFlag ?? this.aajiActiveFlag,
        prevCompany: prevCompany ?? this.prevCompany,
        prevCompanyOthers: prevCompanyOthers ?? this.prevCompanyOthers,
        idFamilyCardNo: idFamilyCardNo ?? this.idFamilyCardNo,
        aasiNo: aasiNo ?? this.aasiNo,
        aasiActiveFlag: aasiActiveFlag ?? this.aasiActiveFlag,
        prevCompanyAasi: prevCompanyAasi ?? this.prevCompanyAasi,
        aauiNo: aauiNo ?? this.aauiNo,
        aauiActiveFlag: aauiActiveFlag ?? this.aauiActiveFlag,
        prevCompanyAaui: prevCompanyAaui ?? this.prevCompanyAaui,
        aauiExpired: aauiExpired ?? this.aauiExpired,
      );

  factory RequestPendingSimpleCheckingModel.fromJson(Map<String, dynamic> json) => _$RequestPendingSimpleCheckingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPendingSimpleCheckingModelToJson(this);
}
