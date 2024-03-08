// To parse this JSON data, do
//
//     final candidateDataModel = candidateDataModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'candidate_data_model.g.dart';

CandidateDataModel candidateDataModelFromJson(String str) => CandidateDataModel.fromJson(json.decode(str));

String candidateDataModelToJson(CandidateDataModel data) => json.encode(data.toJson());

@JsonSerializable()
class CandidateDataModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "userId")
  String? userId;
  @JsonKey(name: "agentCode")
  String? agentCode;
  @JsonKey(name: "clientNumber")
  String? clientNumber;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "middleName")
  dynamic middleName;
  @JsonKey(name: "lastName")
  dynamic lastName;
  @JsonKey(name: "title")
  int? title;
  @JsonKey(name: "position")
  int? position;
  @JsonKey(name: "placeOfBirth")
  String? placeOfBirth;
  @JsonKey(name: "dob")
  String? dob;
  @JsonKey(name: "gender")
  int? gender;
  @JsonKey(name: "weight")
  int? weight;
  @JsonKey(name: "high")
  int? high;
  @JsonKey(name: "religion")
  int? religion;
  @JsonKey(name: "address1")
  String? address1;
  @JsonKey(name: "address2")
  String? address2;
  @JsonKey(name: "address3")
  String? address3;
  @JsonKey(name: "city")
  int? city;
  @JsonKey(name: "province")
  int? province;
  @JsonKey(name: "zipCode")
  int? zipCode;
  @JsonKey(name: "phoneNo")
  String? phoneNo;
  @JsonKey(name: "officePhoneNo")
  dynamic officePhoneNo;
  @JsonKey(name: "cellularNo")
  String? cellularNo;
  @JsonKey(name: "email")
  dynamic email;
  @JsonKey(name: "idCardNo")
  String? idCardNo;
  @JsonKey(name: "maritalStatus")
  int? maritalStatus;
  @JsonKey(name: "heir")
  String? heir;
  @JsonKey(name: "heirRelation")
  String? heirRelation;
  @JsonKey(name: "jointDate")
  String? jointDate;
  @JsonKey(name: "aajiNo")
  dynamic aajiNo;
  @JsonKey(name: "aajiExpired")
  String? aajiExpired;
  @JsonKey(name: "bankAccount")
  String? bankAccount;
  @JsonKey(name: "bankName")
  String? bankName;
  @JsonKey(name: "bankBranch")
  String? bankBranch;
  @JsonKey(name: "bankAccountName")
  String? bankAccountName;
  @JsonKey(name: "npwpNo")
  dynamic npwpNo;
  @JsonKey(name: "npwpName")
  dynamic npwpName;
  @JsonKey(name: "npwpAddress1")
  dynamic npwpAddress1;
  @JsonKey(name: "npwpAddress2")
  dynamic npwpAddress2;
  @JsonKey(name: "npwpAddress3")
  dynamic npwpAddress3;
  @JsonKey(name: "npwpCity")
  int? npwpCity;
  @JsonKey(name: "npwpProvince")
  int? npwpProvince;
  @JsonKey(name: "npwpZipCode")
  dynamic npwpZipCode;
  @JsonKey(name: "spouseName")
  dynamic spouseName;
  @JsonKey(name: "spouseDob")
  String? spouseDob;
  @JsonKey(name: "spouseIdCardNo")
  dynamic spouseIdCardNo;
  @JsonKey(name: "spouseJob")
  dynamic spouseJob;
  @JsonKey(name: "spouseRelation")
  dynamic spouseRelation;
  @JsonKey(name: "spouseIsAgent")
  dynamic spouseIsAgent;
  @JsonKey(name: "spouseAgentCode")
  dynamic spouseAgentCode;
  @JsonKey(name: "spouseUnit")
  dynamic spouseUnit;
  @JsonKey(name: "isReinstate")
  String? isReinstate;
  @JsonKey(name: "leaderName")
  String? leaderName;
  @JsonKey(name: "leaderAgentCode")
  String? leaderAgentCode;
  @JsonKey(name: "leaderSignatureDate")
  String? leaderSignatureDate;
  @JsonKey(name: "leaderSignatureCity")
  dynamic leaderSignatureCity;
  @JsonKey(name: "signatureDate")
  String? signatureDate;
  @JsonKey(name: "signatureCity")
  String? signatureCity;
  @JsonKey(name: "createDate")
  String? createDate;
  @JsonKey(name: "createBy")
  String? createBy;
  @JsonKey(name: "updateDate")
  String? updateDate;
  @JsonKey(name: "updateBy")
  String? updateBy;
  @JsonKey(name: "activeFlag")
  String? activeFlag;
  @JsonKey(name: "verificationNumber")
  dynamic verificationNumber;
  @JsonKey(name: "nationality")
  int? nationality;
  @JsonKey(name: "channelId")
  dynamic channelId;
  @JsonKey(name: "channelCode")
  dynamic channelCode;
  @JsonKey(name: "officeCode")
  String? officeCode;
  @JsonKey(name: "taxType")
  int? taxType;
  @JsonKey(name: "idCardType")
  int? idCardType;
  @JsonKey(name: "officeCity")
  String? officeCity;
  @JsonKey(name: "reinstateOfficeCode")
  String? reinstateOfficeCode;
  @JsonKey(name: "reinstateLeaderName")
  String? reinstateLeaderName;
  @JsonKey(name: "reinstateLastPosition")
  String? reinstateLastPosition;
  @JsonKey(name: "reinstateStatus")
  int? reinstateStatus;
  @JsonKey(name: "reinstateAgentCode")
  dynamic reinstateAgentCode;
  @JsonKey(name: "country")
  int? country;
  @JsonKey(name: "supervisorAgentCode")
  dynamic supervisorAgentCode;
  @JsonKey(name: "locationCode")
  dynamic locationCode;
  @JsonKey(name: "branchCode")
  dynamic branchCode;
  @JsonKey(name: "altReferenceNo")
  dynamic altReferenceNo;
  @JsonKey(name: "occupation")
  int? occupation;
  @JsonKey(name: "occupationOther")
  dynamic occupationOther;
  @JsonKey(name: "isCompleted")
  String? isCompleted;
  @JsonKey(name: "isSuspended")
  String? isSuspended;
  @JsonKey(name: "recruiterAgentCode")
  dynamic recruiterAgentCode;
  @JsonKey(name: "dependent")
  int? dependent;
  @JsonKey(name: "isSubmission")
  String? isSubmission;
  @JsonKey(name: "isBpmStart")
  dynamic isBpmStart;
  @JsonKey(name: "otherReligion")
  dynamic otherReligion;
  @JsonKey(name: "sourceInformation")
  int? sourceInformation;
  @JsonKey(name: "sourceInformationDesc")
  dynamic sourceInformationDesc;
  @JsonKey(name: "isEqualWithKtp")
  dynamic isEqualWithKtp;
  @JsonKey(name: "pickerFaa")
  String? pickerFaa;
  @JsonKey(name: "pickerSimpleChecking")
  String? pickerSimpleChecking;
  @JsonKey(name: "ptkpIsExist")
  dynamic ptkpIsExist;
  @JsonKey(name: "submissionDate")
  String? submissionDate;
  @JsonKey(name: "isCompletedFaa")
  String? isCompletedFaa;
  @JsonKey(name: "isCompletedSimpleChecking")
  String? isCompletedSimpleChecking;
  @JsonKey(name: "resignLetterDate")
  String? resignLetterDate;
  @JsonKey(name: "terminationDate")
  String? terminationDate;
  @JsonKey(name: "isEmailUpdate")
  String? isEmailUpdate;
  @JsonKey(name: "prevCompany")
  int? prevCompany;
  @JsonKey(name: "prevCompanyOthers")
  int? prevCompanyOthers;
  @JsonKey(name: "deletedReason")
  dynamic deletedReason;
  @JsonKey(name: "maritalStatusPtkp")
  dynamic maritalStatusPtkp;
  @JsonKey(name: "faaSubmissionDate")
  String? faaSubmissionDate;
  @JsonKey(name: "pickerActimize")
  dynamic pickerActimize;
  @JsonKey(name: "isReview")
  String? isReview;
  @JsonKey(name: "isSignature")
  String? isSignature;
  @JsonKey(name: "isRelease")
  dynamic isRelease;
  @JsonKey(name: "kpmLocationCode")
  dynamic kpmLocationCode;
  @JsonKey(name: "isReleases")
  dynamic isReleases;
  @JsonKey(name: "idFamilyCardNo")
  String? idFamilyCardNo;
  @JsonKey(name: "aasiNo")
  dynamic aasiNo;
  @JsonKey(name: "prevCompanyAasi")
  int? prevCompanyAasi;
  @JsonKey(name: "aasiExpired")
  String? aasiExpired;
  @JsonKey(name: "aajiActiveFlag")
  bool? aajiActiveFlag;
  @JsonKey(name: "aasiActiveFlag")
  bool? aasiActiveFlag;
  @JsonKey(name: "spouseCompany")
  dynamic spouseCompany;
  @JsonKey(name: "supportingDoc")
  dynamic supportingDoc;
  @JsonKey(name: "aauiNo")
  dynamic aauiNo;
  @JsonKey(name: "aauiActiveFlag")
  bool? aauiActiveFlag;
  @JsonKey(name: "prevCompanyAaui")
  int? prevCompanyAaui;
  @JsonKey(name: "aauiExpired")
  String? aauiExpired;
  @JsonKey(name: "candidateWorkExperienceList")
  dynamic candidateWorkExperienceList;
  @JsonKey(name: "candidateEducationList")
  dynamic candidateEducationList;
  @JsonKey(name: "aajiExamRegisterInfo")
  dynamic aajiExamRegisterInfo;
  @JsonKey(name: "aasiExamRegisterInfo")
  dynamic aasiExamRegisterInfo;
  @JsonKey(name: "tocResultInfoList")
  dynamic tocResultInfoList;
  @JsonKey(name: "candidateDependentList")
  dynamic candidateDependentList;
  @JsonKey(name: "cpdRegisterInfo")
  dynamic cpdRegisterInfo;
  @JsonKey(name: "paymentTransactionList")
  dynamic paymentTransactionList;

  CandidateDataModel({
    this.id,
    this.userId,
    this.agentCode,
    this.clientNumber,
    this.firstName,
    this.middleName,
    this.lastName,
    this.title,
    this.position,
    this.placeOfBirth,
    this.dob,
    this.gender,
    this.weight,
    this.high,
    this.religion,
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.province,
    this.zipCode,
    this.phoneNo,
    this.officePhoneNo,
    this.cellularNo,
    this.email,
    this.idCardNo,
    this.maritalStatus,
    this.heir,
    this.heirRelation,
    this.jointDate,
    this.aajiNo,
    this.aajiExpired,
    this.bankAccount,
    this.bankName,
    this.bankBranch,
    this.bankAccountName,
    this.npwpNo,
    this.npwpName,
    this.npwpAddress1,
    this.npwpAddress2,
    this.npwpAddress3,
    this.npwpCity,
    this.npwpProvince,
    this.npwpZipCode,
    this.spouseName,
    this.spouseDob,
    this.spouseIdCardNo,
    this.spouseJob,
    this.spouseRelation,
    this.spouseIsAgent,
    this.spouseAgentCode,
    this.spouseUnit,
    this.isReinstate,
    this.leaderName,
    this.leaderAgentCode,
    this.leaderSignatureDate,
    this.leaderSignatureCity,
    this.signatureDate,
    this.signatureCity,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.activeFlag,
    this.verificationNumber,
    this.nationality,
    this.channelId,
    this.channelCode,
    this.officeCode,
    this.taxType,
    this.idCardType,
    this.officeCity,
    this.reinstateOfficeCode,
    this.reinstateLeaderName,
    this.reinstateLastPosition,
    this.reinstateStatus,
    this.reinstateAgentCode,
    this.country,
    this.supervisorAgentCode,
    this.locationCode,
    this.branchCode,
    this.altReferenceNo,
    this.occupation,
    this.occupationOther,
    this.isCompleted,
    this.isSuspended,
    this.recruiterAgentCode,
    this.dependent,
    this.isSubmission,
    this.isBpmStart,
    this.otherReligion,
    this.sourceInformation,
    this.sourceInformationDesc,
    this.isEqualWithKtp,
    this.pickerFaa,
    this.pickerSimpleChecking,
    this.ptkpIsExist,
    this.submissionDate,
    this.isCompletedFaa,
    this.isCompletedSimpleChecking,
    this.resignLetterDate,
    this.terminationDate,
    this.isEmailUpdate,
    this.prevCompany,
    this.prevCompanyOthers,
    this.deletedReason,
    this.maritalStatusPtkp,
    this.faaSubmissionDate,
    this.pickerActimize,
    this.isReview,
    this.isSignature,
    this.isRelease,
    this.kpmLocationCode,
    this.isReleases,
    this.idFamilyCardNo,
    this.aasiNo,
    this.prevCompanyAasi,
    this.aasiExpired,
    this.aajiActiveFlag,
    this.aasiActiveFlag,
    this.spouseCompany,
    this.supportingDoc,
    this.aauiNo,
    this.aauiActiveFlag,
    this.prevCompanyAaui,
    this.aauiExpired,
    this.candidateWorkExperienceList,
    this.candidateEducationList,
    this.aajiExamRegisterInfo,
    this.aasiExamRegisterInfo,
    this.tocResultInfoList,
    this.candidateDependentList,
    this.cpdRegisterInfo,
    this.paymentTransactionList,
  });

  CandidateDataModel copyWith({
    int? id,
    String? userId,
    String? agentCode,
    String? clientNumber,
    String? firstName,
    dynamic middleName,
    dynamic lastName,
    int? title,
    int? position,
    String? placeOfBirth,
    String? dob,
    int? gender,
    int? weight,
    int? high,
    int? religion,
    String? address1,
    String? address2,
    String? address3,
    int? city,
    int? province,
    int? zipCode,
    String? phoneNo,
    dynamic officePhoneNo,
    String? cellularNo,
    dynamic email,
    String? idCardNo,
    int? maritalStatus,
    String? heir,
    String? heirRelation,
    String? jointDate,
    dynamic aajiNo,
    String? aajiExpired,
    String? bankAccount,
    String? bankName,
    String? bankBranch,
    String? bankAccountName,
    dynamic npwpNo,
    dynamic npwpName,
    dynamic npwpAddress1,
    dynamic npwpAddress2,
    dynamic npwpAddress3,
    int? npwpCity,
    int? npwpProvince,
    dynamic npwpZipCode,
    dynamic spouseName,
    String? spouseDob,
    dynamic spouseIdCardNo,
    dynamic spouseJob,
    dynamic spouseRelation,
    dynamic spouseIsAgent,
    dynamic spouseAgentCode,
    dynamic spouseUnit,
    String? isReinstate,
    String? leaderName,
    String? leaderAgentCode,
    String? leaderSignatureDate,
    dynamic leaderSignatureCity,
    String? signatureDate,
    String? signatureCity,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    String? activeFlag,
    dynamic verificationNumber,
    int? nationality,
    dynamic channelId,
    dynamic channelCode,
    String? officeCode,
    int? taxType,
    int? idCardType,
    String? officeCity,
    String? reinstateOfficeCode,
    String? reinstateLeaderName,
    String? reinstateLastPosition,
    int? reinstateStatus,
    dynamic reinstateAgentCode,
    int? country,
    dynamic supervisorAgentCode,
    dynamic locationCode,
    dynamic branchCode,
    dynamic altReferenceNo,
    int? occupation,
    dynamic occupationOther,
    String? isCompleted,
    String? isSuspended,
    dynamic recruiterAgentCode,
    int? dependent,
    String? isSubmission,
    dynamic isBpmStart,
    dynamic otherReligion,
    int? sourceInformation,
    dynamic sourceInformationDesc,
    dynamic isEqualWithKtp,
    String? pickerFaa,
    String? pickerSimpleChecking,
    dynamic ptkpIsExist,
    String? submissionDate,
    String? isCompletedFaa,
    String? isCompletedSimpleChecking,
    String? resignLetterDate,
    String? terminationDate,
    String? isEmailUpdate,
    int? prevCompany,
    int? prevCompanyOthers,
    dynamic deletedReason,
    dynamic maritalStatusPtkp,
    String? faaSubmissionDate,
    dynamic pickerActimize,
    String? isReview,
    String? isSignature,
    dynamic isRelease,
    dynamic kpmLocationCode,
    dynamic isReleases,
    String? idFamilyCardNo,
    dynamic aasiNo,
    int? prevCompanyAasi,
    String? aasiExpired,
    bool? aajiActiveFlag,
    bool? aasiActiveFlag,
    dynamic spouseCompany,
    dynamic supportingDoc,
    dynamic aauiNo,
    bool? aauiActiveFlag,
    int? prevCompanyAaui,
    String? aauiExpired,
    dynamic candidateWorkExperienceList,
    dynamic candidateEducationList,
    dynamic aajiExamRegisterInfo,
    dynamic aasiExamRegisterInfo,
    dynamic tocResultInfoList,
    dynamic candidateDependentList,
    dynamic cpdRegisterInfo,
    dynamic paymentTransactionList,
  }) =>
      CandidateDataModel(
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
        createDate: createDate ?? this.createDate,
        createBy: createBy ?? this.createBy,
        updateDate: updateDate ?? this.updateDate,
        updateBy: updateBy ?? this.updateBy,
        activeFlag: activeFlag ?? this.activeFlag,
        verificationNumber: verificationNumber ?? this.verificationNumber,
        nationality: nationality ?? this.nationality,
        channelId: channelId ?? this.channelId,
        channelCode: channelCode ?? this.channelCode,
        officeCode: officeCode ?? this.officeCode,
        taxType: taxType ?? this.taxType,
        idCardType: idCardType ?? this.idCardType,
        officeCity: officeCity ?? this.officeCity,
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
        isCompleted: isCompleted ?? this.isCompleted,
        isSuspended: isSuspended ?? this.isSuspended,
        recruiterAgentCode: recruiterAgentCode ?? this.recruiterAgentCode,
        dependent: dependent ?? this.dependent,
        isSubmission: isSubmission ?? this.isSubmission,
        isBpmStart: isBpmStart ?? this.isBpmStart,
        otherReligion: otherReligion ?? this.otherReligion,
        sourceInformation: sourceInformation ?? this.sourceInformation,
        sourceInformationDesc: sourceInformationDesc ?? this.sourceInformationDesc,
        isEqualWithKtp: isEqualWithKtp ?? this.isEqualWithKtp,
        pickerFaa: pickerFaa ?? this.pickerFaa,
        pickerSimpleChecking: pickerSimpleChecking ?? this.pickerSimpleChecking,
        ptkpIsExist: ptkpIsExist ?? this.ptkpIsExist,
        submissionDate: submissionDate ?? this.submissionDate,
        isCompletedFaa: isCompletedFaa ?? this.isCompletedFaa,
        isCompletedSimpleChecking: isCompletedSimpleChecking ?? this.isCompletedSimpleChecking,
        resignLetterDate: resignLetterDate ?? this.resignLetterDate,
        terminationDate: terminationDate ?? this.terminationDate,
        isEmailUpdate: isEmailUpdate ?? this.isEmailUpdate,
        prevCompany: prevCompany ?? this.prevCompany,
        prevCompanyOthers: prevCompanyOthers ?? this.prevCompanyOthers,
        deletedReason: deletedReason ?? this.deletedReason,
        maritalStatusPtkp: maritalStatusPtkp ?? this.maritalStatusPtkp,
        faaSubmissionDate: faaSubmissionDate ?? this.faaSubmissionDate,
        pickerActimize: pickerActimize ?? this.pickerActimize,
        isReview: isReview ?? this.isReview,
        isSignature: isSignature ?? this.isSignature,
        isRelease: isRelease ?? this.isRelease,
        kpmLocationCode: kpmLocationCode ?? this.kpmLocationCode,
        isReleases: isReleases ?? this.isReleases,
        idFamilyCardNo: idFamilyCardNo ?? this.idFamilyCardNo,
        aasiNo: aasiNo ?? this.aasiNo,
        prevCompanyAasi: prevCompanyAasi ?? this.prevCompanyAasi,
        aasiExpired: aasiExpired ?? this.aasiExpired,
        aajiActiveFlag: aajiActiveFlag ?? this.aajiActiveFlag,
        aasiActiveFlag: aasiActiveFlag ?? this.aasiActiveFlag,
        spouseCompany: spouseCompany ?? this.spouseCompany,
        supportingDoc: supportingDoc ?? this.supportingDoc,
        aauiNo: aauiNo ?? this.aauiNo,
        aauiActiveFlag: aauiActiveFlag ?? this.aauiActiveFlag,
        prevCompanyAaui: prevCompanyAaui ?? this.prevCompanyAaui,
        aauiExpired: aauiExpired ?? this.aauiExpired,
        candidateWorkExperienceList: candidateWorkExperienceList ?? this.candidateWorkExperienceList,
        candidateEducationList: candidateEducationList ?? this.candidateEducationList,
        aajiExamRegisterInfo: aajiExamRegisterInfo ?? this.aajiExamRegisterInfo,
        aasiExamRegisterInfo: aasiExamRegisterInfo ?? this.aasiExamRegisterInfo,
        tocResultInfoList: tocResultInfoList ?? this.tocResultInfoList,
        candidateDependentList: candidateDependentList ?? this.candidateDependentList,
        cpdRegisterInfo: cpdRegisterInfo ?? this.cpdRegisterInfo,
        paymentTransactionList: paymentTransactionList ?? this.paymentTransactionList,
      );

  factory CandidateDataModel.fromJson(Map<String, dynamic> json) => _$CandidateDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateDataModelToJson(this);
}
