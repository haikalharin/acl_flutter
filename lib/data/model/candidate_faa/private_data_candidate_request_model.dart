// To parse this JSON data, do
//
//     final privateDataCandidateRequestModel = privateDataCandidateRequestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'private_data_candidate_request_model.g.dart';

PrivateDataCandidateRequestModel privateDataCandidateRequestModelFromJson(String str) => PrivateDataCandidateRequestModel.fromJson(json.decode(str));

String privateDataCandidateRequestModelToJson(PrivateDataCandidateRequestModel data) => json.encode(data.toJson());

@JsonSerializable()
class PrivateDataCandidateRequestModel {
  @JsonKey(name: "candidate")
  Candidate candidate;

  PrivateDataCandidateRequestModel({
    required this.candidate,
  });

  PrivateDataCandidateRequestModel copyWith({
    Candidate? candidate,
  }) =>
      PrivateDataCandidateRequestModel(
        candidate: candidate ?? this.candidate,
      );

  factory PrivateDataCandidateRequestModel.fromJson(Map<String, dynamic> json) => _$PrivateDataCandidateRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivateDataCandidateRequestModelToJson(this);
}

@JsonSerializable()
class Candidate {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "userID")
  String userId;
  @JsonKey(name: "agentCode")
  String agentCode;
  @JsonKey(name: "clientNumber")
  String clientNumber;
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "middleName")
  String middleName;
  @JsonKey(name: "lastName")
  String lastName;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "position")
  String position;
  @JsonKey(name: "placeOfBirth")
  String placeOfBirth;
  @JsonKey(name: "dob")
  String dob;
  @JsonKey(name: "gender")
  String gender;
  @JsonKey(name: "weight")
  String weight;
  @JsonKey(name: "high")
  String high;
  @JsonKey(name: "religion")
  String religion;
  @JsonKey(name: "address1")
  String address1;
  @JsonKey(name: "address2")
  String address2;
  @JsonKey(name: "address3")
  String address3;
  @JsonKey(name: "city")
  String city;
  @JsonKey(name: "province")
  String province;
  @JsonKey(name: "zipCode")
  String zipCode;
  @JsonKey(name: "phoneNo")
  String phoneNo;
  @JsonKey(name: "officePhoneNo")
  String officePhoneNo;
  @JsonKey(name: "cellularNo")
  String cellularNo;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "idCardNo")
  String idCardNo;
  @JsonKey(name: "maritalStatus")
  String maritalStatus;
  @JsonKey(name: "heir")
  String heir;
  @JsonKey(name: "heirRelation")
  String heirRelation;
  @JsonKey(name: "jointDate")
  String jointDate;
  @JsonKey(name: "aajiNo")
  String aajiNo;
  @JsonKey(name: "aajiExpired")
  String aajiExpired;
  @JsonKey(name: "aasiNo")
  String aasiNo;
  @JsonKey(name: "aasiExpired")
  String aasiExpired;
  @JsonKey(name: "bankAccount")
  String bankAccount;
  @JsonKey(name: "bankName")
  String bankName;
  @JsonKey(name: "bankBranch")
  String bankBranch;
  @JsonKey(name: "bankAccountName")
  String bankAccountName;
  @JsonKey(name: "npwpNo")
  String npwpNo;
  @JsonKey(name: "npwpName")
  String npwpName;
  @JsonKey(name: "npwpAddress1")
  String npwpAddress1;
  @JsonKey(name: "npwpAddress2")
  String npwpAddress2;
  @JsonKey(name: "npwpAddress3")
  String npwpAddress3;
  @JsonKey(name: "npwpCity")
  String npwpCity;
  @JsonKey(name: "npwpProvince")
  String npwpProvince;
  @JsonKey(name: "npwpZipCode")
  String npwpZipCode;
  @JsonKey(name: "spouseName")
  String spouseName;
  @JsonKey(name: "spouseDob")
  String spouseDob;
  @JsonKey(name: "spouseIdCardNo")
  String spouseIdCardNo;
  @JsonKey(name: "spouseJob")
  String spouseJob;
  @JsonKey(name: "spouseRelation")
  String spouseRelation;
  @JsonKey(name: "spouseIsAgent")
  String spouseIsAgent;
  @JsonKey(name: "spouseAgentCode")
  String spouseAgentCode;
  @JsonKey(name: "spouseUnit")
  String spouseUnit;
  @JsonKey(name: "isReinstate")
  String isReinstate;
  @JsonKey(name: "leaderName")
  String leaderName;
  @JsonKey(name: "leaderAgentCode")
  String leaderAgentCode;
  @JsonKey(name: "leaderSignatureDate")
  String leaderSignatureDate;
  @JsonKey(name: "leaderSignatureCity")
  String leaderSignatureCity;
  @JsonKey(name: "signatureDate")
  String signatureDate;
  @JsonKey(name: "signatureCity")
  String signatureCity;
  @JsonKey(name: "verificationNumber")
  String verificationNumber;
  @JsonKey(name: "nationality")
  String nationality;
  @JsonKey(name: "channelID")
  String channelId;
  @JsonKey(name: "channelCode")
  String channelCode;
  @JsonKey(name: "officeCode")
  String officeCode;
  @JsonKey(name: "officeCity")
  String officeCity;
  @JsonKey(name: "taxType")
  String taxType;
  @JsonKey(name: "idCardType")
  String idCardType;
  @JsonKey(name: "reinstateOfficeCode")
  String reinstateOfficeCode;
  @JsonKey(name: "reinstateLeaderName")
  String reinstateLeaderName;
  @JsonKey(name: "reinstateLastPosition")
  String reinstateLastPosition;
  @JsonKey(name: "reinstateStatus")
  String reinstateStatus;
  @JsonKey(name: "reinstateAgentCode")
  String reinstateAgentCode;
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "supervisorAgentCode")
  String supervisorAgentCode;
  @JsonKey(name: "locationCode")
  String locationCode;
  @JsonKey(name: "branchCode")
  String branchCode;
  @JsonKey(name: "altReferenceNo")
  String altReferenceNo;
  @JsonKey(name: "occupation")
  String occupation;
  @JsonKey(name: "occupationOther")
  String occupationOther;
  @JsonKey(name: "isSubmission")
  String isSubmission;
  @JsonKey(name: "isCompleted")
  String isCompleted;
  @JsonKey(name: "isSignature")
  String isSignature;
  @JsonKey(name: "dependent")
  String dependent;
  @JsonKey(name: "otherReligion")
  String otherReligion;
  @JsonKey(name: "sourceInformation")
  String sourceInformation;
  @JsonKey(name: "sourceInformationDesc")
  String sourceInformationDesc;
  @JsonKey(name: "isEqualWithKtp")
  String isEqualWithKtp;
  @JsonKey(name: "ptkpIsExist")
  String ptkpIsExist;
  @JsonKey(name: "resignLetterDate")
  String resignLetterDate;
  @JsonKey(name: "terminationDate")
  String terminationDate;
  @JsonKey(name: "prevCompany")
  String prevCompany;
  @JsonKey(name: "prevCompanyOthers")
  String prevCompanyOthers;
  @JsonKey(name: "prevCompanyAasi")
  String prevCompanyAasi;
  @JsonKey(name: "prevCompanyAaui")
  String prevCompanyAaui;
  @JsonKey(name: "aajiActiveFlag")
  bool aajiActiveFlag;
  @JsonKey(name: "aasiActiveFlag")
  bool aasiActiveFlag;
  @JsonKey(name: "aauiActiveFlag")
  bool aauiActiveFlag;
  @JsonKey(name: "maritalStatusPTKP")
  String maritalStatusPtkp;

  Candidate({
    required this.id,
    required this.userId,
    required this.agentCode,
    required this.clientNumber,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.title,
    required this.position,
    required this.placeOfBirth,
    required this.dob,
    required this.gender,
    required this.weight,
    required this.high,
    required this.religion,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.province,
    required this.zipCode,
    required this.phoneNo,
    required this.officePhoneNo,
    required this.cellularNo,
    required this.email,
    required this.idCardNo,
    required this.maritalStatus,
    required this.heir,
    required this.heirRelation,
    required this.jointDate,
    required this.aajiNo,
    required this.aajiExpired,
    required this.aasiNo,
    required this.aasiExpired,
    required this.bankAccount,
    required this.bankName,
    required this.bankBranch,
    required this.bankAccountName,
    required this.npwpNo,
    required this.npwpName,
    required this.npwpAddress1,
    required this.npwpAddress2,
    required this.npwpAddress3,
    required this.npwpCity,
    required this.npwpProvince,
    required this.npwpZipCode,
    required this.spouseName,
    required this.spouseDob,
    required this.spouseIdCardNo,
    required this.spouseJob,
    required this.spouseRelation,
    required this.spouseIsAgent,
    required this.spouseAgentCode,
    required this.spouseUnit,
    required this.isReinstate,
    required this.leaderName,
    required this.leaderAgentCode,
    required this.leaderSignatureDate,
    required this.leaderSignatureCity,
    required this.signatureDate,
    required this.signatureCity,
    required this.verificationNumber,
    required this.nationality,
    required this.channelId,
    required this.channelCode,
    required this.officeCode,
    required this.officeCity,
    required this.taxType,
    required this.idCardType,
    required this.reinstateOfficeCode,
    required this.reinstateLeaderName,
    required this.reinstateLastPosition,
    required this.reinstateStatus,
    required this.reinstateAgentCode,
    required this.country,
    required this.supervisorAgentCode,
    required this.locationCode,
    required this.branchCode,
    required this.altReferenceNo,
    required this.occupation,
    required this.occupationOther,
    required this.isSubmission,
    required this.isCompleted,
    required this.isSignature,
    required this.dependent,
    required this.otherReligion,
    required this.sourceInformation,
    required this.sourceInformationDesc,
    required this.isEqualWithKtp,
    required this.ptkpIsExist,
    required this.resignLetterDate, //confirm persertifikat
    required this.terminationDate, //confirm persertifikat
    required this.prevCompany,
    required this.prevCompanyOthers,
    required this.prevCompanyAasi,
    required this.prevCompanyAaui,
    required this.aajiActiveFlag,
    required this.aasiActiveFlag,
    required this.aauiActiveFlag,
    required this.maritalStatusPtkp,
  });

  Candidate copyWith({
    String? id,
    String? userId,
    String? agentCode,
    String? clientNumber,
    String? firstName,
    String? middleName,
    String? lastName,
    String? title,
    String? position,
    String? placeOfBirth,
    String? dob,
    String? gender,
    String? weight,
    String? high,
    String? religion,
    String? address1,
    String? address2,
    String? address3,
    String? city,
    String? province,
    String? zipCode,
    String? phoneNo,
    String? officePhoneNo,
    String? cellularNo,
    String? email,
    String? idCardNo,
    String? maritalStatus,
    String? heir,
    String? heirRelation,
    String? jointDate,
    String? aajiNo,
    String? aajiExpired,
    String? aasiNo,
    String? aasiExpired,
    String? bankAccount,
    String? bankName,
    String? bankBranch,
    String? bankAccountName,
    String? npwpNo,
    String? npwpName,
    String? npwpAddress1,
    String? npwpAddress2,
    String? npwpAddress3,
    String? npwpCity,
    String? npwpProvince,
    String? npwpZipCode,
    String? spouseName,
    String? spouseDob,
    String? spouseIdCardNo,
    String? spouseJob,
    String? spouseRelation,
    String? spouseIsAgent,
    String? spouseAgentCode,
    String? spouseUnit,
    String? isReinstate,
    String? leaderName,
    String? leaderAgentCode,
    String? leaderSignatureDate,
    String? leaderSignatureCity,
    String? signatureDate,
    String? signatureCity,
    String? verificationNumber,
    String? nationality,
    String? channelId,
    String? channelCode,
    String? officeCode,
    String? officeCity,
    String? taxType,
    String? idCardType,
    String? reinstateOfficeCode,
    String? reinstateLeaderName,
    String? reinstateLastPosition,
    String? reinstateStatus,
    String? reinstateAgentCode,
    String? country,
    String? supervisorAgentCode,
    String? locationCode,
    String? branchCode,
    String? altReferenceNo,
    String? occupation,
    String? occupationOther,
    String? isSubmission,
    String? isCompleted,
    String? isSignature,
    String? dependent,
    String? otherReligion,
    String? sourceInformation,
    String? sourceInformationDesc,
    String? isEqualWithKtp,
    String? ptkpIsExist,
    String? resignLetterDate,
    String? terminationDate,
    String? prevCompany,
    String? prevCompanyOthers,
    String? prevCompanyAasi,
    String? prevCompanyAaui,
    bool? aajiActiveFlag,
    bool? aasiActiveFlag,
    bool? aauiActiveFlag,
    String? maritalStatusPtkp,
  }) =>
      Candidate(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        agentCode: agentCode ?? this.agentCode,
        clientNumber: clientNumber ?? this.clientNumber,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        title: title ?? this.title,
        position: position ?? this.position,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        weight: weight ?? this.weight,
        high: high ?? this.high,
        religion: religion ?? this.religion,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        address3: address3 ?? this.address3,
        city: city ?? this.city,
        province: province ?? this.province,
        zipCode: zipCode ?? this.zipCode,
        phoneNo: phoneNo ?? this.phoneNo,
        officePhoneNo: officePhoneNo ?? this.officePhoneNo,
        cellularNo: cellularNo ?? this.cellularNo,
        email: email ?? this.email,
        idCardNo: idCardNo ?? this.idCardNo,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        heir: heir ?? this.heir,
        heirRelation: heirRelation ?? this.heirRelation,
        jointDate: jointDate ?? this.jointDate,
        aajiNo: aajiNo ?? this.aajiNo,
        aajiExpired: aajiExpired ?? this.aajiExpired,
        aasiNo: aasiNo ?? this.aasiNo,
        aasiExpired: aasiExpired ?? this.aasiExpired,
        bankAccount: bankAccount ?? this.bankAccount,
        bankName: bankName ?? this.bankName,
        bankBranch: bankBranch ?? this.bankBranch,
        bankAccountName: bankAccountName ?? this.bankAccountName,
        npwpNo: npwpNo ?? this.npwpNo,
        npwpName: npwpName ?? this.npwpName,
        npwpAddress1: npwpAddress1 ?? this.npwpAddress1,
        npwpAddress2: npwpAddress2 ?? this.npwpAddress2,
        npwpAddress3: npwpAddress3 ?? this.npwpAddress3,
        npwpCity: npwpCity ?? this.npwpCity,
        npwpProvince: npwpProvince ?? this.npwpProvince,
        npwpZipCode: npwpZipCode ?? this.npwpZipCode,
        spouseName: spouseName ?? this.spouseName,
        spouseDob: spouseDob ?? this.spouseDob,
        spouseIdCardNo: spouseIdCardNo ?? this.spouseIdCardNo,
        spouseJob: spouseJob ?? this.spouseJob,
        spouseRelation: spouseRelation ?? this.spouseRelation,
        spouseIsAgent: spouseIsAgent ?? this.spouseIsAgent,
        spouseAgentCode: spouseAgentCode ?? this.spouseAgentCode,
        spouseUnit: spouseUnit ?? this.spouseUnit,
        isReinstate: isReinstate ?? this.isReinstate,
        leaderName: leaderName ?? this.leaderName,
        leaderAgentCode: leaderAgentCode ?? this.leaderAgentCode,
        leaderSignatureDate: leaderSignatureDate ?? this.leaderSignatureDate,
        leaderSignatureCity: leaderSignatureCity ?? this.leaderSignatureCity,
        signatureDate: signatureDate ?? this.signatureDate,
        signatureCity: signatureCity ?? this.signatureCity,
        verificationNumber: verificationNumber ?? this.verificationNumber,
        nationality: nationality ?? this.nationality,
        channelId: channelId ?? this.channelId,
        channelCode: channelCode ?? this.channelCode,
        officeCode: officeCode ?? this.officeCode,
        officeCity: officeCity ?? this.officeCity,
        taxType: taxType ?? this.taxType,
        idCardType: idCardType ?? this.idCardType,
        reinstateOfficeCode: reinstateOfficeCode ?? this.reinstateOfficeCode,
        reinstateLeaderName: reinstateLeaderName ?? this.reinstateLeaderName,
        reinstateLastPosition: reinstateLastPosition ?? this.reinstateLastPosition,
        reinstateStatus: reinstateStatus ?? this.reinstateStatus,
        reinstateAgentCode: reinstateAgentCode ?? this.reinstateAgentCode,
        country: country ?? this.country,
        supervisorAgentCode: supervisorAgentCode ?? this.supervisorAgentCode,
        locationCode: locationCode ?? this.locationCode,
        branchCode: branchCode ?? this.branchCode,
        altReferenceNo: altReferenceNo ?? this.altReferenceNo,
        occupation: occupation ?? this.occupation,
        occupationOther: occupationOther ?? this.occupationOther,
        isSubmission: isSubmission ?? this.isSubmission,
        isCompleted: isCompleted ?? this.isCompleted,
        isSignature: isSignature ?? this.isSignature,
        dependent: dependent ?? this.dependent,
        otherReligion: otherReligion ?? this.otherReligion,
        sourceInformation: sourceInformation ?? this.sourceInformation,
        sourceInformationDesc: sourceInformationDesc ?? this.sourceInformationDesc,
        isEqualWithKtp: isEqualWithKtp ?? this.isEqualWithKtp,
        ptkpIsExist: ptkpIsExist ?? this.ptkpIsExist,
        resignLetterDate: resignLetterDate ?? this.resignLetterDate,
        terminationDate: terminationDate ?? this.terminationDate,
        prevCompany: prevCompany ?? this.prevCompany,
        prevCompanyOthers: prevCompanyOthers ?? this.prevCompanyOthers,
        prevCompanyAasi: prevCompanyAasi ?? this.prevCompanyAasi,
        prevCompanyAaui: prevCompanyAaui ?? this.prevCompanyAaui,
        aajiActiveFlag: aajiActiveFlag ?? this.aajiActiveFlag,
        aasiActiveFlag: aasiActiveFlag ?? this.aasiActiveFlag,
        aauiActiveFlag: aauiActiveFlag ?? this.aauiActiveFlag,
        maritalStatusPtkp: maritalStatusPtkp ?? this.maritalStatusPtkp,
      );

  factory Candidate.fromJson(Map<String, dynamic> json) => _$CandidateFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}
