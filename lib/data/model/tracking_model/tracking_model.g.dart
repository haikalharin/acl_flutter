// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingModel _$TrackingModelFromJson(Map<String, dynamic> json) =>
    TrackingModel(
      id: json['id'] as String?,
      candidateId: json['candidateId'] as String?,
      trackingDate: json['trackingDate'] as String?,
      descriptionStatusId: json['descriptionStatusId'] as String?,
      descriptionType: json['descriptionType'] as String?,
      descriptionInd: json['descriptionInd'] as String?,
      descriptionEng: json['descriptionEng'] as String?,
      trackingStatus: json['trackingStatus'],
      tabName: json['tabName'] as String?,
      fieldName: json['fieldName'] as String?,
      reason: json['reason'],
      status: json['status'],
      productTypeAaji: json['productTypeAaji'],
      examTypeAasi: json['examTypeAasi'],
      reasonAasi: json['reasonAasi'],
      productTypeAasi: json['productTypeAasi'],
    );

Map<String, dynamic> _$TrackingModelToJson(TrackingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'candidateId': instance.candidateId,
      'trackingDate': instance.trackingDate,
      'descriptionStatusId': instance.descriptionStatusId,
      'descriptionType': instance.descriptionType,
      'descriptionInd': instance.descriptionInd,
      'descriptionEng': instance.descriptionEng,
      'trackingStatus': instance.trackingStatus,
      'tabName': instance.tabName,
      'fieldName': instance.fieldName,
      'reason': instance.reason,
      'status': instance.status,
      'productTypeAaji': instance.productTypeAaji,
      'examTypeAasi': instance.examTypeAasi,
      'reasonAasi': instance.reasonAasi,
      'productTypeAasi': instance.productTypeAasi,
    };
