// To parse this JSON data, do
//
//     final trackingModel = trackingModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'tracking_model.g.dart';

TrackingModel trackingModelFromJson(String str) => TrackingModel.fromJson(json.decode(str));

String trackingModelToJson(TrackingModel data) => json.encode(data.toJson());

@JsonSerializable()
class TrackingModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "candidateId")
  String? candidateId;
  @JsonKey(name: "trackingDate")
  String? trackingDate;
  @JsonKey(name: "descriptionStatusId")
  String? descriptionStatusId;
  @JsonKey(name: "descriptionType")
  String? descriptionType;
  @JsonKey(name: "descriptionInd")
  String? descriptionInd;
  @JsonKey(name: "descriptionEng")
  String? descriptionEng;
  @JsonKey(name: "trackingStatus")
  dynamic trackingStatus;
  @JsonKey(name: "tabName")
  String? tabName;
  @JsonKey(name: "fieldName")
  String? fieldName;
  @JsonKey(name: "reason")
  dynamic reason;
  @JsonKey(name: "status")
  dynamic status;
  @JsonKey(name: "productTypeAaji")
  dynamic productTypeAaji;
  @JsonKey(name: "examTypeAasi")
  dynamic examTypeAasi;
  @JsonKey(name: "reasonAasi")
  dynamic reasonAasi;
  @JsonKey(name: "productTypeAasi")
  dynamic productTypeAasi;

  TrackingModel({
    this.id,
    this.candidateId,
    this.trackingDate,
    this.descriptionStatusId,
    this.descriptionType,
    this.descriptionInd,
    this.descriptionEng,
    this.trackingStatus,
    this.tabName,
    this.fieldName,
    this.reason,
    this.status,
    this.productTypeAaji,
    this.examTypeAasi,
    this.reasonAasi,
    this.productTypeAasi,
  });

  TrackingModel copyWith({
    String? id,
    String? candidateId,
    String? trackingDate,
    String? descriptionStatusId,
    String? descriptionType,
    String? descriptionInd,
    String? descriptionEng,
    dynamic trackingStatus,
    String? tabName,
    String? fieldName,
    dynamic reason,
    dynamic status,
    dynamic productTypeAaji,
    dynamic examTypeAasi,
    dynamic reasonAasi,
    dynamic productTypeAasi,
  }) =>
      TrackingModel(
        id: id ?? this.id,
        candidateId: candidateId ?? this.candidateId,
        trackingDate: trackingDate ?? this.trackingDate,
        descriptionStatusId: descriptionStatusId ?? this.descriptionStatusId,
        descriptionType: descriptionType ?? this.descriptionType,
        descriptionInd: descriptionInd ?? this.descriptionInd,
        descriptionEng: descriptionEng ?? this.descriptionEng,
        trackingStatus: trackingStatus ?? this.trackingStatus,
        tabName: tabName ?? this.tabName,
        fieldName: fieldName ?? this.fieldName,
        reason: reason ?? this.reason,
        status: status ?? this.status,
        productTypeAaji: productTypeAaji ?? this.productTypeAaji,
        examTypeAasi: examTypeAasi ?? this.examTypeAasi,
        reasonAasi: reasonAasi ?? this.reasonAasi,
        productTypeAasi: productTypeAasi ?? this.productTypeAasi,
      );

  factory TrackingModel.fromJson(Map<String, dynamic> json) => _$TrackingModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingModelToJson(this);
}
