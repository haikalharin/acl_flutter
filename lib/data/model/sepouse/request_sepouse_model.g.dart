// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_sepouse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestSepouseModel _$RequestSepouseModelFromJson(Map<String, dynamic> json) =>
    RequestSepouseModel(
      candidateId: json['candidateId'] as String?,
      familyCardNo: json['familyCardNo'] as String?,
      familyDetails: (json['familyDetails'] as List<dynamic>?)
          ?.map((e) => FamilyDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestSepouseModelToJson(
        RequestSepouseModel instance) =>
    <String, dynamic>{
      'candidateId': instance.candidateId,
      'familyCardNo': instance.familyCardNo,
      'familyDetails': instance.familyDetails,
    };

FamilyDetail _$FamilyDetailFromJson(Map<String, dynamic> json) => FamilyDetail(
      idCardNo: json['idCardNo'] as String?,
      firstName: json['firstName'] as String?,
      gender: json['gender'] as String?,
      relation: json['relation'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
    );

Map<String, dynamic> _$FamilyDetailToJson(FamilyDetail instance) =>
    <String, dynamic>{
      'idCardNo': instance.idCardNo,
      'firstName': instance.firstName,
      'gender': instance.gender,
      'relation': instance.relation,
      'dateOfBirth': instance.dateOfBirth,
    };
