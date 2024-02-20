// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_data_candidate_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivateDataCandidateRequestModel _$PrivateDataCandidateRequestModelFromJson(
        Map<String, dynamic> json) =>
    PrivateDataCandidateRequestModel(
      candidate: Candidate.fromJson(json['candidate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrivateDataCandidateRequestModelToJson(
        PrivateDataCandidateRequestModel instance) =>
    <String, dynamic>{
      'candidate': instance.candidate,
    };

Candidate _$CandidateFromJson(Map<String, dynamic> json) => Candidate(
      id: json['id'] as String,
      userId: json['userID'] as String,
      agentCode: json['agentCode'] as String,
      clientNumber: json['clientNumber'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      title: json['title'] as String,
      position: json['position'] as String,
      placeOfBirth: json['placeOfBirth'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
      weight: json['weight'] as String,
      high: json['high'] as String,
      religion: json['religion'] as String,
      address1: json['address1'] as String,
      address2: json['address2'] as String,
      address3: json['address3'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      zipCode: json['zipCode'] as String,
      phoneNo: json['phoneNo'] as String,
      officePhoneNo: json['officePhoneNo'] as String,
      cellularNo: json['cellularNo'] as String,
      email: json['email'] as String,
      idCardNo: json['idCardNo'] as String,
      maritalStatus: json['maritalStatus'] as String,
      heir: json['heir'] as String,
      heirRelation: json['heirRelation'] as String,
      jointDate: json['jointDate'] as String,
      aajiNo: json['aajiNo'] as String,
      aajiExpired: json['aajiExpired'] as String,
      aasiNo: json['aasiNo'] as String,
      aasiExpired: json['aasiExpired'] as String,
      bankAccount: json['bankAccount'] as String,
      bankName: json['bankName'] as String,
      bankBranch: json['bankBranch'] as String,
      bankAccountName: json['bankAccountName'] as String,
      npwpNo: json['npwpNo'] as String,
      npwpName: json['npwpName'] as String,
      npwpAddress1: json['npwpAddress1'] as String,
      npwpAddress2: json['npwpAddress2'] as String,
      npwpAddress3: json['npwpAddress3'] as String,
      npwpCity: json['npwpCity'] as String,
      npwpProvince: json['npwpProvince'] as String,
      npwpZipCode: json['npwpZipCode'] as String,
      spouseName: json['spouseName'] as String,
      spouseDob: json['spouseDob'] as String,
      spouseIdCardNo: json['spouseIdCardNo'] as String,
      spouseJob: json['spouseJob'] as String,
      spouseRelation: json['spouseRelation'] as String,
      spouseIsAgent: json['spouseIsAgent'] as String,
      spouseAgentCode: json['spouseAgentCode'] as String,
      spouseUnit: json['spouseUnit'] as String,
      isReinstate: json['isReinstate'] as String,
      leaderName: json['leaderName'] as String,
      leaderAgentCode: json['leaderAgentCode'] as String,
      leaderSignatureDate: json['leaderSignatureDate'] as String,
      leaderSignatureCity: json['leaderSignatureCity'] as String,
      signatureDate: json['signatureDate'] as String,
      signatureCity: json['signatureCity'] as String,
      verificationNumber: json['verificationNumber'] as String,
      nationality: json['nationality'] as String,
      channelId: json['channelID'] as String,
      channelCode: json['channelCode'] as String,
      officeCode: json['officeCode'] as String,
      officeCity: json['officeCity'] as String,
      taxType: json['taxType'] as String,
      idCardType: json['idCardType'] as String,
      reinstateOfficeCode: json['reinstateOfficeCode'] as String,
      reinstateLeaderName: json['reinstateLeaderName'] as String,
      reinstateLastPosition: json['reinstateLastPosition'] as String,
      reinstateStatus: json['reinstateStatus'] as String,
      reinstateAgentCode: json['reinstateAgentCode'] as String,
      country: json['country'] as String,
      supervisorAgentCode: json['supervisorAgentCode'] as String,
      locationCode: json['locationCode'] as String,
      branchCode: json['branchCode'] as String,
      altReferenceNo: json['altReferenceNo'] as String,
      occupation: json['occupation'] as String,
      occupationOther: json['occupationOther'] as String,
      isSubmission: json['isSubmission'] as String,
      isCompleted: json['isCompleted'] as String,
      isSignature: json['isSignature'] as String,
      dependent: json['dependent'] as String,
      otherReligion: json['otherReligion'] as String,
      sourceInformation: json['sourceInformation'] as String,
      sourceInformationDesc: json['sourceInformationDesc'] as String,
      isEqualWithKtp: json['isEqualWithKtp'] as String,
      ptkpIsExist: json['ptkpIsExist'] as String,
      resignLetterDate: json['resignLetterDate'] as String,
      terminationDate: json['terminationDate'] as String,
      prevCompany: json['prevCompany'] as String,
      prevCompanyOthers: json['prevCompanyOthers'] as String,
      prevCompanyAasi: json['prevCompanyAasi'] as String,
      prevCompanyAaui: json['prevCompanyAaui'] as String,
      aajiActiveFlag: json['aajiActiveFlag'] as bool,
      aasiActiveFlag: json['aasiActiveFlag'] as bool,
      aauiActiveFlag: json['aauiActiveFlag'] as bool,
      maritalStatusPtkp: json['maritalStatusPTKP'] as String,
    );

Map<String, dynamic> _$CandidateToJson(Candidate instance) => <String, dynamic>{
      'id': instance.id,
      'userID': instance.userId,
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
      'aasiNo': instance.aasiNo,
      'aasiExpired': instance.aasiExpired,
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
      'verificationNumber': instance.verificationNumber,
      'nationality': instance.nationality,
      'channelID': instance.channelId,
      'channelCode': instance.channelCode,
      'officeCode': instance.officeCode,
      'officeCity': instance.officeCity,
      'taxType': instance.taxType,
      'idCardType': instance.idCardType,
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
      'isSubmission': instance.isSubmission,
      'isCompleted': instance.isCompleted,
      'isSignature': instance.isSignature,
      'dependent': instance.dependent,
      'otherReligion': instance.otherReligion,
      'sourceInformation': instance.sourceInformation,
      'sourceInformationDesc': instance.sourceInformationDesc,
      'isEqualWithKtp': instance.isEqualWithKtp,
      'ptkpIsExist': instance.ptkpIsExist,
      'resignLetterDate': instance.resignLetterDate,
      'terminationDate': instance.terminationDate,
      'prevCompany': instance.prevCompany,
      'prevCompanyOthers': instance.prevCompanyOthers,
      'prevCompanyAasi': instance.prevCompanyAasi,
      'prevCompanyAaui': instance.prevCompanyAaui,
      'aajiActiveFlag': instance.aajiActiveFlag,
      'aasiActiveFlag': instance.aasiActiveFlag,
      'aauiActiveFlag': instance.aauiActiveFlag,
      'maritalStatusPTKP': instance.maritalStatusPtkp,
    };