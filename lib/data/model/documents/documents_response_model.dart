// To parse this JSON data, do
//
//     final documentsResponseModel = documentsResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'documents_response_model.g.dart';

DocumentsResponseModel documentsResponseModelFromJson(String str) => DocumentsResponseModel.fromJson(json.decode(str));

String documentsResponseModelToJson(DocumentsResponseModel data) => json.encode(data.toJson());

@JsonSerializable()
class DocumentsResponseModel {
  @JsonKey(name: "key")
  int? key;
  @JsonKey(name: "value")
  String? value;

  DocumentsResponseModel({
    this.key,
    this.value,
  });

  DocumentsResponseModel copyWith({
    int? key,
    String? value,
  }) =>
      DocumentsResponseModel(
        key: key ?? this.key,
        value: value ?? this.value,
      );

  factory DocumentsResponseModel.fromJson(Map<String, dynamic> json) => _$DocumentsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentsResponseModelToJson(this);
}
