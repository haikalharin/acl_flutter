// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FamilyCardModel _$FamilyCardModelFromJson(Map<String, dynamic> json) =>
    FamilyCardModel(
      candidateId: json['candidateId'] as String?,
      familyCardNo: json['familyCardNo'] as String?,
      familyDetails: (json['familyDetails'] as List<dynamic>?)
          ?.map((e) => FamilyDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FamilyCardModelToJson(FamilyCardModel instance) =>
    <String, dynamic>{
      'candidateId': instance.candidateId,
      'familyCardNo': instance.familyCardNo,
      'familyDetails': instance.familyDetails,
    };

FamilyDetail _$FamilyDetailFromJson(Map<String, dynamic> json) => FamilyDetail(
      id: json['id'] as int?,
      idCardNo: json['idCardNo'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'],
      lastName: json['lastName'],
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      relation: json['relation'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$FamilyDetailToJson(FamilyDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idCardNo': instance.idCardNo,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'relation': instance.relation,
      'status': instance.status,
    };
