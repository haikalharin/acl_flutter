// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateDataModel _$CandidateDataModelFromJson(Map<String, dynamic> json) =>
    CandidateDataModel(
      id: json['id'] as int?,
      userId: json['userId'] as String?,
      agentCode: json['agentCode'] as String?,
      clientNumber: json['clientNumber'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'],
      lastName: json['lastName'],
      title: json['title'] as int?,
      position: json['position'] as int?,
      placeOfBirth: json['placeOfBirth'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as int?,
      weight: json['weight'] as int?,
      high: json['high'] as int?,
      religion: json['religion'] as int?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      address3: json['address3'] as String?,
      city: json['city'] as int?,
      province: json['province'] as int?,
      zipCode: json['zipCode'] as int?,
      phoneNo: json['phoneNo'] as String?,
      officePhoneNo: json['officePhoneNo'],
      cellularNo: json['cellularNo'] as String?,
      email: json['email'],
      idCardNo: json['idCardNo'] as String?,
      maritalStatus: json['maritalStatus'] as int?,
      heir: json['heir'] as String?,
      heirRelation: json['heirRelation'] as String?,
      jointDate: json['jointDate'] as String?,
      aajiNo: json['aajiNo'],
      aajiExpired: json['aajiExpired'] as String?,
      bankAccount: json['bankAccount'] as String?,
      bankName: json['bankName'] as String?,
      bankBranch: json['bankBranch'] as String?,
      bankAccountName: json['bankAccountName'] as String?,
      npwpNo: json['npwpNo'],
      npwpName: json['npwpName'],
      npwpAddress1: json['npwpAddress1'],
      npwpAddress2: json['npwpAddress2'],
      npwpAddress3: json['npwpAddress3'],
      npwpCity: json['npwpCity'] as int?,
      npwpProvince: json['npwpProvince'] as int?,
      npwpZipCode: json['npwpZipCode'],
      spouseName: json['spouseName'],
      spouseDob: json['spouseDob'] as String?,
      spouseIdCardNo: json['spouseIdCardNo'],
      spouseJob: json['spouseJob'],
      spouseRelation: json['spouseRelation'],
      spouseIsAgent: json['spouseIsAgent'],
      spouseAgentCode: json['spouseAgentCode'],
      spouseUnit: json['spouseUnit'],
      isReinstate: json['isReinstate'] as String?,
      leaderName: json['leaderName'] as String?,
      leaderAgentCode: json['leaderAgentCode'] as String?,
      leaderSignatureDate: json['leaderSignatureDate'] as String?,
      leaderSignatureCity: json['leaderSignatureCity'],
      signatureDate: json['signatureDate'] as String?,
      signatureCity: json['signatureCity'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      activeFlag: json['activeFlag'] as String?,
      verificationNumber: json['verificationNumber'],
      nationality: json['nationality'] as int?,
      channelId: json['channelId'],
      channelCode: json['channelCode'],
      officeCode: json['officeCode'] as String?,
      taxType: json['taxType'] as int?,
      idCardType: json['idCardType'] as int?,
      officeCity: json['officeCity'] as String?,
      reinstateOfficeCode: json['reinstateOfficeCode'] as String?,
      reinstateLeaderName: json['reinstateLeaderName'] as String?,
      reinstateLastPosition: json['reinstateLastPosition'] as String?,
      reinstateStatus: json['reinstateStatus'] as int?,
      reinstateAgentCode: json['reinstateAgentCode'],
      country: json['country'] as int?,
      supervisorAgentCode: json['supervisorAgentCode'],
      locationCode: json['locationCode'],
      branchCode: json['branchCode'],
      altReferenceNo: json['altReferenceNo'],
      occupation: json['occupation'] as int?,
      occupationOther: json['occupationOther'],
      isCompleted: json['isCompleted'] as String?,
      isSuspended: json['isSuspended'] as String?,
      recruiterAgentCode: json['recruiterAgentCode'],
      dependent: json['dependent'] as int?,
      isSubmission: json['isSubmission'] as String?,
      isBpmStart: json['isBpmStart'],
      otherReligion: json['otherReligion'],
      sourceInformation: json['sourceInformation'] as int?,
      sourceInformationDesc: json['sourceInformationDesc'],
      isEqualWithKtp: json['isEqualWithKtp'],
      pickerFaa: json['pickerFaa'] as String?,
      pickerSimpleChecking: json['pickerSimpleChecking'] as String?,
      ptkpIsExist: json['ptkpIsExist'],
      submissionDate: json['submissionDate'] as String?,
      isCompletedFaa: json['isCompletedFaa'] as String?,
      isCompletedSimpleChecking: json['isCompletedSimpleChecking'] as String?,
      resignLetterDate: json['resignLetterDate'] as String?,
      terminationDate: json['terminationDate'] as String?,
      isEmailUpdate: json['isEmailUpdate'] as String?,
      prevCompany: json['prevCompany'] as int?,
      prevCompanyOthers: json['prevCompanyOthers'],
      deletedReason: json['deletedReason'],
      maritalStatusPtkp: json['maritalStatusPtkp'],
      faaSubmissionDate: json['faaSubmissionDate'] as String?,
      pickerActimize: json['pickerActimize'],
      isReview: json['isReview'] as String?,
      isSignature: json['isSignature'] as String?,
      isRelease: json['isRelease'],
      kpmLocationCode: json['kpmLocationCode'],
      isReleases: json['isReleases'],
      idFamilyCardNo: json['idFamilyCardNo'] as String?,
      aasiNo: json['aasiNo'],
      prevCompanyAasi: json['prevCompanyAasi'] as int?,
      aasiExpired: json['aasiExpired'] as String?,
      aajiActiveFlag: json['aajiActiveFlag'] as bool?,
      aasiActiveFlag: json['aasiActiveFlag'] as bool?,
      spouseCompany: json['spouseCompany'],
      supportingDoc: json['supportingDoc'],
      aauiNo: json['aauiNo'],
      aauiActiveFlag: json['aauiActiveFlag'] as bool?,
      prevCompanyAaui: json['prevCompanyAaui'],
      aauiExpired: json['aauiExpired'] as String?,
      candidateWorkExperienceList: json['candidateWorkExperienceList'],
      candidateEducationList: json['candidateEducationList'],
      aajiExamRegisterInfo: json['aajiExamRegisterInfo'],
      aasiExamRegisterInfo: json['aasiExamRegisterInfo'],
      tocResultInfoList: json['tocResultInfoList'],
      candidateDependentList: json['candidateDependentList'],
      cpdRegisterInfo: json['cpdRegisterInfo'],
      paymentTransactionList: json['paymentTransactionList'],
    );

Map<String, dynamic> _$CandidateDataModelToJson(CandidateDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'agentCode': instance.agentCode,
      'clientNumber': instance.clientNumber,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'title': instance.title,
      'position': instance.position,
      'placeOfBirth': instance.placeOfBirth,
      'dob': instance.dob,
      'gender': instance.gender,
      'weight': instance.weight,
      'high': instance.high,
      'religion': instance.religion,
      'address1': instance.address1,
      'address2': instance.address2,
      'address3': instance.address3,
      'city': instance.city,
      'province': instance.province,
      'zipCode': instance.zipCode,
      'phoneNo': instance.phoneNo,
      'officePhoneNo': instance.officePhoneNo,
      'cellularNo': instance.cellularNo,
      'email': instance.email,
      'idCardNo': instance.idCardNo,
      'maritalStatus': instance.maritalStatus,
      'heir': instance.heir,
      'heirRelation': instance.heirRelation,
      'jointDate': instance.jointDate,
      'aajiNo': instance.aajiNo,
      'aajiExpired': instance.aajiExpired,
      'bankAccount': instance.bankAccount,
      'bankName': instance.bankName,
      'bankBranch': instance.bankBranch,
      'bankAccountName': instance.bankAccountName,
      'npwpNo': instance.npwpNo,
      'npwpName': instance.npwpName,
      'npwpAddress1': instance.npwpAddress1,
      'npwpAddress2': instance.npwpAddress2,
      'npwpAddress3': instance.npwpAddress3,
      'npwpCity': instance.npwpCity,
      'npwpProvince': instance.npwpProvince,
      'npwpZipCode': instance.npwpZipCode,
      'spouseName': instance.spouseName,
      'spouseDob': instance.spouseDob,
      'spouseIdCardNo': instance.spouseIdCardNo,
      'spouseJob': instance.spouseJob,
      'spouseRelation': instance.spouseRelation,
      'spouseIsAgent': instance.spouseIsAgent,
      'spouseAgentCode': instance.spouseAgentCode,
      'spouseUnit': instance.spouseUnit,
      'isReinstate': instance.isReinstate,
      'leaderName': instance.leaderName,
      'leaderAgentCode': instance.leaderAgentCode,
      'leaderSignatureDate': instance.leaderSignatureDate,
      'leaderSignatureCity': instance.leaderSignatureCity,
      'signatureDate': instance.signatureDate,
      'signatureCity': instance.signatureCity,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'activeFlag': instance.activeFlag,
      'verificationNumber': instance.verificationNumber,
      'nationality': instance.nationality,
      'channelId': instance.channelId,
      'channelCode': instance.channelCode,
      'officeCode': instance.officeCode,
      'taxType': instance.taxType,
      'idCardType': instance.idCardType,
      'officeCity': instance.officeCity,
      'reinstateOfficeCode': instance.reinstateOfficeCode,
      'reinstateLeaderName': instance.reinstateLeaderName,
      'reinstateLastPosition': instance.reinstateLastPosition,
      'reinstateStatus': instance.reinstateStatus,
      'reinstateAgentCode': instance.reinstateAgentCode,
      'country': instance.country,
      'supervisorAgentCode': instance.supervisorAgentCode,
      'locationCode': instance.locationCode,
      'branchCode': instance.branchCode,
      'altReferenceNo': instance.altReferenceNo,
      'occupation': instance.occupation,
      'occupationOther': instance.occupationOther,
      'isCompleted': instance.isCompleted,
      'isSuspended': instance.isSuspended,
      'recruiterAgentCode': instance.recruiterAgentCode,
      'dependent': instance.dependent,
      'isSubmission': instance.isSubmission,
      'isBpmStart': instance.isBpmStart,
      'otherReligion': instance.otherReligion,
      'sourceInformation': instance.sourceInformation,
      'sourceInformationDesc': instance.sourceInformationDesc,
      'isEqualWithKtp': instance.isEqualWithKtp,
      'pickerFaa': instance.pickerFaa,
      'pickerSimpleChecking': instance.pickerSimpleChecking,
      'ptkpIsExist': instance.ptkpIsExist,
      'submissionDate': instance.submissionDate,
      'isCompletedFaa': instance.isCompletedFaa,
      'isCompletedSimpleChecking': instance.isCompletedSimpleChecking,
      'resignLetterDate': instance.resignLetterDate,
      'terminationDate': instance.terminationDate,
      'isEmailUpdate': instance.isEmailUpdate,
      'prevCompany': instance.prevCompany,
      'prevCompanyOthers': instance.prevCompanyOthers,
      'deletedReason': instance.deletedReason,
      'maritalStatusPtkp': instance.maritalStatusPtkp,
      'faaSubmissionDate': instance.faaSubmissionDate,
      'pickerActimize': instance.pickerActimize,
      'isReview': instance.isReview,
      'isSignature': instance.isSignature,
      'isRelease': instance.isRelease,
      'kpmLocationCode': instance.kpmLocationCode,
      'isReleases': instance.isReleases,
      'idFamilyCardNo': instance.idFamilyCardNo,
      'aasiNo': instance.aasiNo,
      'prevCompanyAasi': instance.prevCompanyAasi,
      'aasiExpired': instance.aasiExpired,
      'aajiActiveFlag': instance.aajiActiveFlag,
      'aasiActiveFlag': instance.aasiActiveFlag,
      'spouseCompany': instance.spouseCompany,
      'supportingDoc': instance.supportingDoc,
      'aauiNo': instance.aauiNo,
      'aauiActiveFlag': instance.aauiActiveFlag,
      'prevCompanyAaui': instance.prevCompanyAaui,
      'aauiExpired': instance.aauiExpired,
      'candidateWorkExperienceList': instance.candidateWorkExperienceList,
      'candidateEducationList': instance.candidateEducationList,
      'aajiExamRegisterInfo': instance.aajiExamRegisterInfo,
      'aasiExamRegisterInfo': instance.aasiExamRegisterInfo,
      'tocResultInfoList': instance.tocResultInfoList,
      'candidateDependentList': instance.candidateDependentList,
      'cpdRegisterInfo': instance.cpdRegisterInfo,
      'paymentTransactionList': instance.paymentTransactionList,
    };
