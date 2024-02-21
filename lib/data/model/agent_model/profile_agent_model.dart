// To parse this JSON data, do
//
//     final profileAgentModel = profileAgentModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'profile_agent_model.g.dart';

ProfileAgentModel profileAgentModelFromJson(String str) => ProfileAgentModel.fromJson(json.decode(str));

String profileAgentModelToJson(ProfileAgentModel data) => json.encode(data.toJson());

@JsonSerializable()
class ProfileAgentModel {
  @JsonKey(name: "p_SEX")
  String? pSex;
  @JsonKey(name: "p_MARITAL_STATUS")
  String? pMaritalStatus;
  @JsonKey(name: "p_AGENT_RETIDENTIAL_ADDRESS")
  String? pAgentRetidentialAddress;
  @JsonKey(name: "p_AGENT_EMAIL")
  String? pAgentEmail;
  @JsonKey(name: "p_AGENT_NAME")
  String? pAgentName;
  @JsonKey(name: "p_AGENT_DOB")
  String? pAgentDob;
  @JsonKey(name: "p_JOINT_DATE")
  String? pJointDate;
  @JsonKey(name: "p_AGENT_CITY")
  String? pAgentCity;
  @JsonKey(name: "p_AGENT_KTPID")
  String? pAgentKtpid;
  @JsonKey(name: "p_AGENT_RELIGION")
  String? pAgentReligion;
  @JsonKey(name: "p_OFFICE_ADDRESS")
  String? pOfficeAddress;
  @JsonKey(name: "p_OFFICE_CITY")
  String? pOfficeCity;
  @JsonKey(name: "p_OFFICE_PHONE")
  String? pOfficePhone;
  @JsonKey(name: "p_RECRUITER_CODE")
  String? pRecruiterCode;
  @JsonKey(name: "p_RECRUITER_NAME")
  String? pRecruiterName;
  @JsonKey(name: "p_REGION_HEAD")
  String? pRegionHead;
  @JsonKey(name: "p_CHANNEL_NAME")
  String? pChannelName;
  @JsonKey(name: "p_LOCATION_CODE")
  String? pLocationCode;
  @JsonKey(name: "p_LOCATION_NAME")
  String? pLocationName;
  @JsonKey(name: "p_REGION_CODE")
  String? pRegionCode;
  @JsonKey(name: "p_HANDPHONE_NUMBER")
  String? pHandphoneNumber;
  @JsonKey(name: "p_AGENT_PLACEOF_BIRTH")
  String? pAgentPlaceofBirth;
  @JsonKey(name: "p_AGENT_CODE")
  String? pAgentCode;
  @JsonKey(name: "p_AGENT_STATUS")
  String? pAgentStatus;
  @JsonKey(name: "p_RBD_CODE")
  String? pRbdCode;
  @JsonKey(name: "p_RBD_NAME")
  String? pRbdName;
  @JsonKey(name: "p_RBD_EMAIL")
  String? pRbdEmail;
  @JsonKey(name: "p_SUPERVISOR_NAME")
  String? pSupervisorName;
  @JsonKey(name: "p_SUPERVISOR_POSITION")
  String? pSupervisorPosition;
  @JsonKey(name: "p_AREA_NAME")
  String? pAreaName;
  @JsonKey(name: "p_CHANNEL_CODE")
  String? pChannelCode;
  @JsonKey(name: "p_ORG_UNIT3")
  String? pOrgUnit3;
  @JsonKey(name: "p_ORGANIZATION_NAME")
  String? pOrganizationName;
  @JsonKey(name: "p_CHANNEL_ID")
  int? pChannelId;
  @JsonKey(name: "p_AGENT_POSITION")
  String? pAgentPosition;
  @JsonKey(name: "p_PART_ID")
  int? pPartId;
  @JsonKey(name: "p_RECRUITER_MAIL")
  String? pRecruiterMail;
  @JsonKey(name: "p_SUPERVISOR_CODE")
  String? pSupervisorCode;
  @JsonKey(name: "p_REGION_NAME")
  String? pRegionName;

  ProfileAgentModel({
    this.pSex,
    this.pMaritalStatus,
    this.pAgentRetidentialAddress,
    this.pAgentEmail,
    this.pAgentName,
    this.pAgentDob,
    this.pJointDate,
    this.pAgentCity,
    this.pAgentKtpid,
    this.pAgentReligion,
    this.pOfficeAddress,
    this.pOfficeCity,
    this.pOfficePhone,
    this.pRecruiterCode,
    this.pRecruiterName,
    this.pRegionHead,
    this.pChannelName,
    this.pLocationCode,
    this.pLocationName,
    this.pRegionCode,
    this.pHandphoneNumber,
    this.pAgentPlaceofBirth,
    this.pAgentCode,
    this.pAgentStatus,
    this.pRbdCode,
    this.pRbdName,
    this.pRbdEmail,
    this.pSupervisorName,
    this.pSupervisorPosition,
    this.pAreaName,
    this.pChannelCode,
    this.pOrgUnit3,
    this.pOrganizationName,
    this.pChannelId,
    this.pAgentPosition,
    this.pPartId,
    this.pRecruiterMail,
    this.pSupervisorCode,
    this.pRegionName,
  });

  ProfileAgentModel copyWith({
    String? pSex,
    String? pMaritalStatus,
    String? pAgentRetidentialAddress,
    String? pAgentEmail,
    String? pAgentName,
    String? pAgentDob,
    String? pJointDate,
    String? pAgentCity,
    String? pAgentKtpid,
    String? pAgentReligion,
    String? pOfficeAddress,
    String? pOfficeCity,
    String? pOfficePhone,
    String? pRecruiterCode,
    String? pRecruiterName,
    String? pRegionHead,
    String? pChannelName,
    String? pLocationCode,
    String? pLocationName,
    String? pRegionCode,
    String? pHandphoneNumber,
    String? pAgentPlaceofBirth,
    String? pAgentCode,
    String? pAgentStatus,
    String? pRbdCode,
    String? pRbdName,
    String? pRbdEmail,
    String? pSupervisorName,
    String? pSupervisorPosition,
    String? pAreaName,
    String? pChannelCode,
    String? pOrgUnit3,
    String? pOrganizationName,
    int? pChannelId,
    String? pAgentPosition,
    int? pPartId,
    String? pRecruiterMail,
    String? pSupervisorCode,
    String? pRegionName,
  }) =>
      ProfileAgentModel(
        pSex: pSex ?? this.pSex,
        pMaritalStatus: pMaritalStatus ?? this.pMaritalStatus,
        pAgentRetidentialAddress: pAgentRetidentialAddress ?? this.pAgentRetidentialAddress,
        pAgentEmail: pAgentEmail ?? this.pAgentEmail,
        pAgentName: pAgentName ?? this.pAgentName,
        pAgentDob: pAgentDob ?? this.pAgentDob,
        pJointDate: pJointDate ?? this.pJointDate,
        pAgentCity: pAgentCity ?? this.pAgentCity,
        pAgentKtpid: pAgentKtpid ?? this.pAgentKtpid,
        pAgentReligion: pAgentReligion ?? this.pAgentReligion,
        pOfficeAddress: pOfficeAddress ?? this.pOfficeAddress,
        pOfficeCity: pOfficeCity ?? this.pOfficeCity,
        pOfficePhone: pOfficePhone ?? this.pOfficePhone,
        pRecruiterCode: pRecruiterCode ?? this.pRecruiterCode,
        pRecruiterName: pRecruiterName ?? this.pRecruiterName,
        pRegionHead: pRegionHead ?? this.pRegionHead,
        pChannelName: pChannelName ?? this.pChannelName,
        pLocationCode: pLocationCode ?? this.pLocationCode,
        pLocationName: pLocationName ?? this.pLocationName,
        pRegionCode: pRegionCode ?? this.pRegionCode,
        pHandphoneNumber: pHandphoneNumber ?? this.pHandphoneNumber,
        pAgentPlaceofBirth: pAgentPlaceofBirth ?? this.pAgentPlaceofBirth,
        pAgentCode: pAgentCode ?? this.pAgentCode,
        pAgentStatus: pAgentStatus ?? this.pAgentStatus,
        pRbdCode: pRbdCode ?? this.pRbdCode,
        pRbdName: pRbdName ?? this.pRbdName,
        pRbdEmail: pRbdEmail ?? this.pRbdEmail,
        pSupervisorName: pSupervisorName ?? this.pSupervisorName,
        pSupervisorPosition: pSupervisorPosition ?? this.pSupervisorPosition,
        pAreaName: pAreaName ?? this.pAreaName,
        pChannelCode: pChannelCode ?? this.pChannelCode,
        pOrgUnit3: pOrgUnit3 ?? this.pOrgUnit3,
        pOrganizationName: pOrganizationName ?? this.pOrganizationName,
        pChannelId: pChannelId ?? this.pChannelId,
        pAgentPosition: pAgentPosition ?? this.pAgentPosition,
        pPartId: pPartId ?? this.pPartId,
        pRecruiterMail: pRecruiterMail ?? this.pRecruiterMail,
        pSupervisorCode: pSupervisorCode ?? this.pSupervisorCode,
        pRegionName: pRegionName ?? this.pRegionName,
      );

  factory ProfileAgentModel.fromJson(Map<String, dynamic> json) => _$ProfileAgentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileAgentModelToJson(this);
}
