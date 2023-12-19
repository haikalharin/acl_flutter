// To parse this JSON data, do
//
//     final candidateFolderDocModel = candidateFolderDocModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'candidate_folder_doc_model.g.dart';

CandidateFolderDocModel candidateFolderDocModelFromJson(String str) => CandidateFolderDocModel.fromJson(json.decode(str));

String candidateFolderDocModelToJson(CandidateFolderDocModel data) => json.encode(data.toJson());

@JsonSerializable()
class CandidateFolderDocModel {
  @JsonKey(name: "folderId")
  String? folderId;
 @JsonKey(name: "fileId")
  String? fileId;

  CandidateFolderDocModel({
    this.folderId,
    this.fileId,
  });

  CandidateFolderDocModel copyWith({
    String? folderId,
    String? fileId,
  }) =>
      CandidateFolderDocModel(
        folderId: folderId ?? this.folderId,
        fileId: fileId ?? this.fileId,
      );

  factory CandidateFolderDocModel.fromJson(Map<String, dynamic> json) => _$CandidateFolderDocModelFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateFolderDocModelToJson(this);
}
