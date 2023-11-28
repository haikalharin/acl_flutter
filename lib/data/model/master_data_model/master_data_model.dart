// To parse this JSON data, do
//
//     final masterDataModel = masterDataModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'master_data_model.g.dart';

MasterDataModel masterDataModelFromJson(String str) => MasterDataModel.fromJson(json.decode(str));

String masterDataModelToJson(MasterDataModel data) => json.encode(data.toJson());

@JsonSerializable()
class MasterDataModel {
  @JsonKey(name: "masterData")
  MasterData? masterData;
  @JsonKey(name: "supportingDocumentList")
  SupportingDocumentList? supportingDocumentList;
  @JsonKey(name: "descriptionStatusList")
  DescriptionStatusList? descriptionStatusList;
  @JsonKey(name: "masterTocData")
  MasterTocData? masterTocData;
  @JsonKey(name: "aajiExamScheduleList")
  AajiExamScheduleList? aajiExamScheduleList;
  @JsonKey(name: "aajiExamChargeList")
  AajiExamChargeList? aajiExamChargeList;
  @JsonKey(name: "cpdProgramList")
  CpdProgramList? cpdProgramList;
  @JsonKey(name: "cpdModuleList")
  CpdModuleList? cpdModuleList;
  @JsonKey(name: "cpdExamChargeList")
  CpdExamChargeList? cpdExamChargeList;
  @JsonKey(name: "cpdElectiveScheduleList")
  CpdElectiveScheduleList? cpdElectiveScheduleList;

  MasterDataModel({
    this.masterData,
    this.supportingDocumentList,
    this.descriptionStatusList,
    this.masterTocData,
    this.aajiExamScheduleList,
    this.aajiExamChargeList,
    this.cpdProgramList,
    this.cpdModuleList,
    this.cpdExamChargeList,
    this.cpdElectiveScheduleList,
  });

  MasterDataModel copyWith({
    MasterData? masterData,
    SupportingDocumentList? supportingDocumentList,
    DescriptionStatusList? descriptionStatusList,
    MasterTocData? masterTocData,
    AajiExamScheduleList? aajiExamScheduleList,
    AajiExamChargeList? aajiExamChargeList,
    CpdProgramList? cpdProgramList,
    CpdModuleList? cpdModuleList,
    CpdExamChargeList? cpdExamChargeList,
    CpdElectiveScheduleList? cpdElectiveScheduleList,
  }) =>
      MasterDataModel(
        masterData: masterData ?? this.masterData,
        supportingDocumentList: supportingDocumentList ?? this.supportingDocumentList,
        descriptionStatusList: descriptionStatusList ?? this.descriptionStatusList,
        masterTocData: masterTocData ?? this.masterTocData,
        aajiExamScheduleList: aajiExamScheduleList ?? this.aajiExamScheduleList,
        aajiExamChargeList: aajiExamChargeList ?? this.aajiExamChargeList,
        cpdProgramList: cpdProgramList ?? this.cpdProgramList,
        cpdModuleList: cpdModuleList ?? this.cpdModuleList,
        cpdExamChargeList: cpdExamChargeList ?? this.cpdExamChargeList,
        cpdElectiveScheduleList: cpdElectiveScheduleList ?? this.cpdElectiveScheduleList,
      );

  factory MasterDataModel.fromJson(Map<String, dynamic> json) => _$MasterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MasterDataModelToJson(this);
}

@JsonSerializable()
class AajiExamChargeList {
  @JsonKey(name: "aajiExamCharge")
  List<AajiExamCharge>? aajiExamCharge;

  AajiExamChargeList({
    this.aajiExamCharge,
  });

  AajiExamChargeList copyWith({
    List<AajiExamCharge>? aajiExamCharge,
  }) =>
      AajiExamChargeList(
        aajiExamCharge: aajiExamCharge ?? this.aajiExamCharge,
      );

  factory AajiExamChargeList.fromJson(Map<String, dynamic> json) => _$AajiExamChargeListFromJson(json);

  Map<String, dynamic> toJson() => _$AajiExamChargeListToJson(this);
}

@JsonSerializable()
class AajiExamCharge {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "aajiType")
  String? aajiType;
  @JsonKey(name: "registerStatus")
  String? registerStatus;
  @JsonKey(name: "licenseType")
  String? licenseType;
  @JsonKey(name: "aajiExamType")
  String? aajiExamType;
  @JsonKey(name: "registerType")
  String? registerType;
  @JsonKey(name: "reprintType")
  String? reprintType;
  @JsonKey(name: "aajiCharge")
  String? aajiCharge;
  @JsonKey(name: "activeFlag")
  String? activeFlag;
  @JsonKey(name: "createBy")
  String? createBy;
  @JsonKey(name: "createDate")
  String? createDate;
  @JsonKey(name: "updateBy")
  String? updateBy;
  @JsonKey(name: "updateDate")
  String? updateDate;

  AajiExamCharge({
    this.id,
    this.aajiType,
    this.registerStatus,
    this.licenseType,
    this.aajiExamType,
    this.registerType,
    this.reprintType,
    this.aajiCharge,
    this.activeFlag,
    this.createBy,
    this.createDate,
    this.updateBy,
    this.updateDate,
  });

  AajiExamCharge copyWith({
    int? id,
    String? aajiType,
    String? registerStatus,
    String? licenseType,
    String? aajiExamType,
    String? registerType,
    String? reprintType,
    String? aajiCharge,
    String? activeFlag,
    String? createBy,
    String? createDate,
    String? updateBy,
    String? updateDate,
  }) =>
      AajiExamCharge(
        id: id ?? this.id,
        aajiType: aajiType ?? this.aajiType,
        registerStatus: registerStatus ?? this.registerStatus,
        licenseType: licenseType ?? this.licenseType,
        aajiExamType: aajiExamType ?? this.aajiExamType,
        registerType: registerType ?? this.registerType,
        reprintType: reprintType ?? this.reprintType,
        aajiCharge: aajiCharge ?? this.aajiCharge,
        activeFlag: activeFlag ?? this.activeFlag,
        createBy: createBy ?? this.createBy,
        createDate: createDate ?? this.createDate,
        updateBy: updateBy ?? this.updateBy,
        updateDate: updateDate ?? this.updateDate,
      );

  factory AajiExamCharge.fromJson(Map<String, dynamic> json) => _$AajiExamChargeFromJson(json);

  Map<String, dynamic> toJson() => _$AajiExamChargeToJson(this);
}

@JsonSerializable()
class AajiExamScheduleList {
  @JsonKey(name: "aajiExamSchedule")
  List<AajiExamSchedule>? aajiExamSchedule;

  AajiExamScheduleList({
    this.aajiExamSchedule,
  });

  AajiExamScheduleList copyWith({
    List<AajiExamSchedule>? aajiExamSchedule,
  }) =>
      AajiExamScheduleList(
        aajiExamSchedule: aajiExamSchedule ?? this.aajiExamSchedule,
      );

  factory AajiExamScheduleList.fromJson(Map<String, dynamic> json) => _$AajiExamScheduleListFromJson(json);

  Map<String, dynamic> toJson() => _$AajiExamScheduleListToJson(this);
}

@JsonSerializable()
class AajiExamSchedule {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "batchId")
  String? batchId;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "endTime")
  String? endTime;
  @JsonKey(name: "examDate")
  String? examDate;
  @JsonKey(name: "examSession")
  String? examSession;
  @JsonKey(name: "expiredDate")
  String? expiredDate;
  @JsonKey(name: "licenseType")
  String? licenseType;
  @JsonKey(name: "licenseTypeId")
  int? licenseTypeId;
  @JsonKey(name: "location")
  String? location;
  @JsonKey(name: "locationId")
  int? locationId;
  @JsonKey(name: "locationName")
  String? locationName;
  @JsonKey(name: "quota")
  int? quota;
  @JsonKey(name: "startTime")
  String? startTime;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "typeId")
  int? typeId;

  AajiExamSchedule({
    this.id,
    this.batchId,
    this.description,
    this.endTime,
    this.examDate,
    this.examSession,
    this.expiredDate,
    this.licenseType,
    this.licenseTypeId,
    this.location,
    this.locationId,
    this.locationName,
    this.quota,
    this.startTime,
    this.type,
    this.typeId,
  });

  AajiExamSchedule copyWith({
    int? id,
    String? batchId,
    String? description,
    String? endTime,
    String? examDate,
    String? examSession,
    String? expiredDate,
    String? licenseType,
    int? licenseTypeId,
    String? location,
    int? locationId,
    String? locationName,
    int? quota,
    String? startTime,
    String? type,
    int? typeId,
  }) =>
      AajiExamSchedule(
        id: id ?? this.id,
        batchId: batchId ?? this.batchId,
        description: description ?? this.description,
        endTime: endTime ?? this.endTime,
        examDate: examDate ?? this.examDate,
        examSession: examSession ?? this.examSession,
        expiredDate: expiredDate ?? this.expiredDate,
        licenseType: licenseType ?? this.licenseType,
        licenseTypeId: licenseTypeId ?? this.licenseTypeId,
        location: location ?? this.location,
        locationId: locationId ?? this.locationId,
        locationName: locationName ?? this.locationName,
        quota: quota ?? this.quota,
        startTime: startTime ?? this.startTime,
        type: type ?? this.type,
        typeId: typeId ?? this.typeId,
      );

  factory AajiExamSchedule.fromJson(Map<String, dynamic> json) => _$AajiExamScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$AajiExamScheduleToJson(this);
}

@JsonSerializable()
class CpdElectiveScheduleList {
  @JsonKey(name: "cpdElectiveSchedule")
  List<CpdElectiveSchedule>? cpdElectiveSchedule;

  CpdElectiveScheduleList({
    this.cpdElectiveSchedule,
  });

  CpdElectiveScheduleList copyWith({
    List<CpdElectiveSchedule>? cpdElectiveSchedule,
  }) =>
      CpdElectiveScheduleList(
        cpdElectiveSchedule: cpdElectiveSchedule ?? this.cpdElectiveSchedule,
      );

  factory CpdElectiveScheduleList.fromJson(Map<String, dynamic> json) => _$CpdElectiveScheduleListFromJson(json);

  Map<String, dynamic> toJson() => _$CpdElectiveScheduleListToJson(this);
}

@JsonSerializable()
class CpdElectiveSchedule {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "idClass")
  String? idClass;
  @JsonKey(name: "className")
  String? className;
  @JsonKey(name: "venue")
  String? venue;
  @JsonKey(name: "maxParticipant")
  int? maxParticipant;
  @JsonKey(name: "startDate")
  String? startDate;
  @JsonKey(name: "endDate")
  String? endDate;
  @JsonKey(name: "startTime")
  String? startTime;
  @JsonKey(name: "endTime")
  String? endTime;
  @JsonKey(name: "cpdModuleId")
  int? cpdModuleId;
  @JsonKey(name: "idModule")
  String? idModule;
  @JsonKey(name: "moduleName")
  String? moduleName;
  @JsonKey(name: "idProgram")
  String? idProgram;
  @JsonKey(name: "programName")
  String? programName;
  @JsonKey(name: "cpdLocationId")
  int? cpdLocationId;
  @JsonKey(name: "idLocation")
  String? idLocation;
  @JsonKey(name: "locationName")
  String? locationName;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "cityId")
  int? cityId;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "idTrainer")
  String? idTrainer;
  @JsonKey(name: "trainerName")
  String? trainerName;
  @JsonKey(name: "trainerStatus")
  String? trainerStatus;
  @JsonKey(name: "certName")
  dynamic certName;
  @JsonKey(name: "certYear")
  dynamic certYear;
  @JsonKey(name: "certBy")
  dynamic certBy;
  @JsonKey(name: "charge")
  double? charge;

  CpdElectiveSchedule({
    this.id,
    this.idClass,
    this.className,
    this.venue,
    this.maxParticipant,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.cpdModuleId,
    this.idModule,
    this.moduleName,
    this.idProgram,
    this.programName,
    this.cpdLocationId,
    this.idLocation,
    this.locationName,
    this.address,
    this.cityId,
    this.city,
    this.idTrainer,
    this.trainerName,
    this.trainerStatus,
    this.certName,
    this.certYear,
    this.certBy,
    this.charge,
  });

  CpdElectiveSchedule copyWith({
    int? id,
    String? idClass,
    String? className,
    String? venue,
    int? maxParticipant,
    String? startDate,
    String? endDate,
    String? startTime,
    String? endTime,
    int? cpdModuleId,
    String? idModule,
    String? moduleName,
    String? idProgram,
    String? programName,
    int? cpdLocationId,
    String? idLocation,
    String? locationName,
    String? address,
    int? cityId,
    String? city,
    String? idTrainer,
    String? trainerName,
    String? trainerStatus,
    dynamic certName,
    dynamic certYear,
    dynamic certBy,
    double? charge,
  }) =>
      CpdElectiveSchedule(
        id: id ?? this.id,
        idClass: idClass ?? this.idClass,
        className: className ?? this.className,
        venue: venue ?? this.venue,
        maxParticipant: maxParticipant ?? this.maxParticipant,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        cpdModuleId: cpdModuleId ?? this.cpdModuleId,
        idModule: idModule ?? this.idModule,
        moduleName: moduleName ?? this.moduleName,
        idProgram: idProgram ?? this.idProgram,
        programName: programName ?? this.programName,
        cpdLocationId: cpdLocationId ?? this.cpdLocationId,
        idLocation: idLocation ?? this.idLocation,
        locationName: locationName ?? this.locationName,
        address: address ?? this.address,
        cityId: cityId ?? this.cityId,
        city: city ?? this.city,
        idTrainer: idTrainer ?? this.idTrainer,
        trainerName: trainerName ?? this.trainerName,
        trainerStatus: trainerStatus ?? this.trainerStatus,
        certName: certName ?? this.certName,
        certYear: certYear ?? this.certYear,
        certBy: certBy ?? this.certBy,
        charge: charge ?? this.charge,
      );

  factory CpdElectiveSchedule.fromJson(Map<String, dynamic> json) => _$CpdElectiveScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$CpdElectiveScheduleToJson(this);
}

@JsonSerializable()
class CpdExamChargeList {
  @JsonKey(name: "cpdExamCharge")
  List<CpdExamCharge>? cpdExamCharge;

  CpdExamChargeList({
    this.cpdExamCharge,
  });

  CpdExamChargeList copyWith({
    List<CpdExamCharge>? cpdExamCharge,
  }) =>
      CpdExamChargeList(
        cpdExamCharge: cpdExamCharge ?? this.cpdExamCharge,
      );

  factory CpdExamChargeList.fromJson(Map<String, dynamic> json) => _$CpdExamChargeListFromJson(json);

  Map<String, dynamic> toJson() => _$CpdExamChargeListToJson(this);
}

@JsonSerializable()
class CpdExamCharge {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "cpdModuleId")
  int? cpdModuleId;
  @JsonKey(name: "cpdModuleCharge")
  int? cpdModuleCharge;

  CpdExamCharge({
    this.id,
    this.cpdModuleId,
    this.cpdModuleCharge,
  });

  CpdExamCharge copyWith({
    int? id,
    int? cpdModuleId,
    int? cpdModuleCharge,
  }) =>
      CpdExamCharge(
        id: id ?? this.id,
        cpdModuleId: cpdModuleId ?? this.cpdModuleId,
        cpdModuleCharge: cpdModuleCharge ?? this.cpdModuleCharge,
      );

  factory CpdExamCharge.fromJson(Map<String, dynamic> json) => _$CpdExamChargeFromJson(json);

  Map<String, dynamic> toJson() => _$CpdExamChargeToJson(this);
}

@JsonSerializable()
class CpdModuleList {
  @JsonKey(name: "cpdModule")
  List<CpdModule>? cpdModule;

  CpdModuleList({
    this.cpdModule,
  });

  CpdModuleList copyWith({
    List<CpdModule>? cpdModule,
  }) =>
      CpdModuleList(
        cpdModule: cpdModule ?? this.cpdModule,
      );

  factory CpdModuleList.fromJson(Map<String, dynamic> json) => _$CpdModuleListFromJson(json);

  Map<String, dynamic> toJson() => _$CpdModuleListToJson(this);
}

@JsonSerializable()
class CpdModule {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "cpdProgramId")
  int? cpdProgramId;
  @JsonKey(name: "endDate")
  String? endDate;
  @JsonKey(name: "examScore")
  double? examScore;
  @JsonKey(name: "examType")
  String? examType;
  @JsonKey(name: "learningMethod")
  int? learningMethod;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "startDate")
  String? startDate;
  @JsonKey(name: "status")
  int? status;

  CpdModule({
    this.id,
    this.cpdProgramId,
    this.endDate,
    this.examScore,
    this.examType,
    this.learningMethod,
    this.name,
    this.startDate,
    this.status,
  });

  CpdModule copyWith({
    int? id,
    int? cpdProgramId,
    String? endDate,
    double? examScore,
    String? examType,
    int? learningMethod,
    String? name,
    String? startDate,
    int? status,
  }) =>
      CpdModule(
        id: id ?? this.id,
        cpdProgramId: cpdProgramId ?? this.cpdProgramId,
        endDate: endDate ?? this.endDate,
        examScore: examScore ?? this.examScore,
        examType: examType ?? this.examType,
        learningMethod: learningMethod ?? this.learningMethod,
        name: name ?? this.name,
        startDate: startDate ?? this.startDate,
        status: status ?? this.status,
      );

  factory CpdModule.fromJson(Map<String, dynamic> json) => _$CpdModuleFromJson(json);

  Map<String, dynamic> toJson() => _$CpdModuleToJson(this);
}

@JsonSerializable()
class CpdProgramList {
  @JsonKey(name: "cpdProgram")
  List<CpdProgram>? cpdProgram;

  CpdProgramList({
    this.cpdProgram,
  });

  CpdProgramList copyWith({
    List<CpdProgram>? cpdProgram,
  }) =>
      CpdProgramList(
        cpdProgram: cpdProgram ?? this.cpdProgram,
      );

  factory CpdProgramList.fromJson(Map<String, dynamic> json) => _$CpdProgramListFromJson(json);

  Map<String, dynamic> toJson() => _$CpdProgramListToJson(this);
}

@JsonSerializable()
class CpdProgram {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "category")
  double? category;
  @JsonKey(name: "idProgram")
  String? idProgram;
  @JsonKey(name: "initialProgram")
  String? initialProgram;
  @JsonKey(name: "scoreMinimum")
  double? scoreMinimum;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "startDate")
  String? startDate;
  @JsonKey(name: "endDate")
  String? endDate;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "type")
  String? type;

  CpdProgram({
    this.id,
    this.category,
    this.idProgram,
    this.initialProgram,
    this.scoreMinimum,
    this.name,
    this.startDate,
    this.endDate,
    this.status,
    this.type,
  });

  CpdProgram copyWith({
    int? id,
    double? category,
    String? idProgram,
    String? initialProgram,
    double? scoreMinimum,
    String? name,
    String? startDate,
    String? endDate,
    int? status,
    String? type,
  }) =>
      CpdProgram(
        id: id ?? this.id,
        category: category ?? this.category,
        idProgram: idProgram ?? this.idProgram,
        initialProgram: initialProgram ?? this.initialProgram,
        scoreMinimum: scoreMinimum ?? this.scoreMinimum,
        name: name ?? this.name,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        type: type ?? this.type,
      );

  factory CpdProgram.fromJson(Map<String, dynamic> json) => _$CpdProgramFromJson(json);

  Map<String, dynamic> toJson() => _$CpdProgramToJson(this);
}

@JsonSerializable()
class DescriptionStatusList {
  @JsonKey(name: "descriptionStatus")
  List<DescriptionStatus>? descriptionStatus;

  DescriptionStatusList({
    this.descriptionStatus,
  });

  DescriptionStatusList copyWith({
    List<DescriptionStatus>? descriptionStatus,
  }) =>
      DescriptionStatusList(
        descriptionStatus: descriptionStatus ?? this.descriptionStatus,
      );

  factory DescriptionStatusList.fromJson(Map<String, dynamic> json) => _$DescriptionStatusListFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionStatusListToJson(this);
}

@JsonSerializable()
class DescriptionStatus {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "tabName")
  String? tabName;
  @JsonKey(name: "fieldname")
  String? fieldname;
  @JsonKey(name: "descriptionInd")
  String? descriptionInd;
  @JsonKey(name: "descriptionEng")
  String? descriptionEng;
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
  @JsonKey(name: "descriptionType")
  String? descriptionType;

  DescriptionStatus({
    this.id,
    this.tabName,
    this.fieldname,
    this.descriptionInd,
    this.descriptionEng,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.activeFlag,
    this.descriptionType,
  });

  DescriptionStatus copyWith({
    int? id,
    String? tabName,
    String? fieldname,
    String? descriptionInd,
    String? descriptionEng,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    String? activeFlag,
    String? descriptionType,
  }) =>
      DescriptionStatus(
        id: id ?? this.id,
        tabName: tabName ?? this.tabName,
        fieldname: fieldname ?? this.fieldname,
        descriptionInd: descriptionInd ?? this.descriptionInd,
        descriptionEng: descriptionEng ?? this.descriptionEng,
        createDate: createDate ?? this.createDate,
        createBy: createBy ?? this.createBy,
        updateDate: updateDate ?? this.updateDate,
        updateBy: updateBy ?? this.updateBy,
        activeFlag: activeFlag ?? this.activeFlag,
        descriptionType: descriptionType ?? this.descriptionType,
      );

  factory DescriptionStatus.fromJson(Map<String, dynamic> json) => _$DescriptionStatusFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionStatusToJson(this);
}

@JsonSerializable()
class MasterData {
  @JsonKey(name: "masterReferenceAll")
  MasterReferenceAll? masterReferenceAll;

  MasterData({
    this.masterReferenceAll,
  });

  MasterData copyWith({
    MasterReferenceAll? masterReferenceAll,
  }) =>
      MasterData(
        masterReferenceAll: masterReferenceAll ?? this.masterReferenceAll,
      );

  factory MasterData.fromJson(Map<String, dynamic> json) => _$MasterDataFromJson(json);

  Map<String, dynamic> toJson() => _$MasterDataToJson(this);
}

@JsonSerializable()
class MasterReferenceAll {
  @JsonKey(name: "AASIEXAMTYPE-ALZ")
  Aajicity? aasiexamtypeAlz;
  @JsonKey(name: "AUTHENTIFICATION")
  Aajicity? authentification;
  @JsonKey(name: "ACCOUNTPAYMENT")
  Aajicity? accountpayment;
  @JsonKey(name: "CPDTRAINERSTATUS")
  Aajicity? cpdtrainerstatus;
  @JsonKey(name: "ACTIMIZEBLACKLISTTYPE")
  Aajicity? actimizeblacklisttype;
  @JsonKey(name: "AZ WEBSITE")
  Aajicity? azWebsite;
  @JsonKey(name: "CPDPROGRAMTYPE")
  City? cpdprogramtype;
  @JsonKey(name: "AAJITYPE")
  Aajicity? aajitype;
  @JsonKey(name: "AZLICATEGORY")
  Aajicity? azlicategory;
  @JsonKey(name: "EDUCATIONTYPE")
  City? educationtype;
  @JsonKey(name: "POSITION")
  Aajicity? position;
  @JsonKey(name: "ADMINEMAIL")
  Aajicity? adminemail;
  @JsonKey(name: "LEARNINGMETHODETYPE")
  Aajicity? learningmethodetype;
  @JsonKey(name: "COUNTRY")
  Aajicity? country;
  @JsonKey(name: "CAONAME")
  Aajicity? caoname;
  @JsonKey(name: "CPDTRAINERTYPE")
  Aajicity? cpdtrainertype;
  @JsonKey(name: "AGENTSTATUSREGISTRATION")
  Aajicity? agentstatusregistration;
  @JsonKey(name: "AZLIOENAME")
  Aajicity? azlioename;
  @JsonKey(name: "EMAILJOB")
  Aajicity? emailjob;
  @JsonKey(name: "AAJIPRODOPUSTYPE")
  Aajicity? aajiprodopustype;
  @JsonKey(name: "LICENSETYPELIST")
  Aajicity? licensetypelist;
  @JsonKey(name: "STATUSPAYMENT")
  Aajicity? statuspayment;
  @JsonKey(name: "AZ ADDRESS 3")
  Aajicity? azAddress3;
  @JsonKey(name: "LICENSEOPUSTYPE")
  Aajicity? licenseopustype;
  @JsonKey(name: "AZ ADDRESS 4")
  Aajicity? azAddress4;
  @JsonKey(name: "AZ ADDRESS 5")
  Aajicity? azAddress5;
  @JsonKey(name: "AZLIBLACKLISTTYPE2")
  Aajicity? azliblacklisttype2;
  @JsonKey(name: "AAJISCHEDULEAVAILABLE")
  Aajicity? aajischeduleavailable;
  @JsonKey(name: "AZLIBLACKLISTTYPE1")
  Aajicity? azliblacklisttype1;
  @JsonKey(name: "IDCARDTYPE")
  Aajicity? idcardtype;
  @JsonKey(name: "PAYMENT_TYPE")
  Aajicity? paymentType;
  @JsonKey(name: "PAYMENTTYPE")
  Aajicity? paymenttype;
  @JsonKey(name: "CPDREGISTERSTATUS")
  Aajicity? cpdregisterstatus;
  @JsonKey(name: "TAXTYPE")
  Aajicity? taxtype;
  @JsonKey(name: "RELIGION")
  Aajicity? religion;
  @JsonKey(name: "STATUSREGISTER")
  Aajicity? statusregister;
  @JsonKey(name: "AAJIEXAMTYPE")
  Aajicity? aajiexamtype;
  @JsonKey(name: "REGISTERSTATUS")
  Aajicity? registerstatus;
  @JsonKey(name: "SIGNATUREDATE")
  Aajicity? signaturedate;
  @JsonKey(name: "AASIREGISTERTYPE")
  Registertype? aasiregistertype;
  @JsonKey(name: "LISTBANK")
  Aajicity? listbank;
  @JsonKey(name: "AZLISDTYPE")
  Aajicity? azlisdtype;
  @JsonKey(name: "REGISTERTYPE")
  Registertype? registertype;
  @JsonKey(name: "AASIREGISTERSTATUS")
  Aajicity? aasiregisterstatus;
  @JsonKey(name: "SOURCEINFORMATION")
  Aajicity? sourceinformation;
  @JsonKey(name: "STATUSAAJILIST")
  Aajicity? statusaajilist;
  @JsonKey(name: "AASIEXAMTYPE-NONALZ")
  Aajicity? aasiexamtypeNonalz;
  @JsonKey(name: "AAJICITY")
  Aajicity? aajicity;
  @JsonKey(name: "APPROVALNAME")
  Aajicity? approvalname;
  @JsonKey(name: "STATUSCONFIRMATION")
  Aajicity? statusconfirmation;
  @JsonKey(name: "CHECKINGSTATUS")
  Checkingstatus? checkingstatus;
  @JsonKey(name: "AZLIBLACKLISTCATEGORY")
  Aajicity? azliblacklistcategory;
  @JsonKey(name: "OCCUPATIONTYPE")
  Checkingstatus? occupationtype;
  @JsonKey(name: "PREVCOMPANY")
  Aajicity? prevcompany;
  @JsonKey(name: "PRODUCTTYPEAASI")
  Aajicity? producttypeaasi;
  @JsonKey(name: "EXAMSTATUS")
  Aajicity? examstatus;
  @JsonKey(name: "TOCTYPE")
  Aajicity? toctype;
  @JsonKey(name: "AZ ADDRESS 1")
  Aajicity? azAddress1;
  @JsonKey(name: "AZ ADDRESS 2")
  Aajicity? azAddress2;
  @JsonKey(name: "MARITALSTATUS")
  Aajicity? maritalstatus;
  @JsonKey(name: "GENDER")
  Aajicity? gender;
  @JsonKey(name: "CHECKINGTYPE")
  Aajicity? checkingtype;
  @JsonKey(name: "PRODUCTTYPEAAJI")
  Aajicity? producttypeaaji;
  @JsonKey(name: "AAJIEXAMRESULT")
  Aajicity? aajiexamresult;
  @JsonKey(name: "AASITYPE")
  Aajicity? aasitype;
  @JsonKey(name: "NATIONALITYTYPE")
  Aajicity? nationalitytype;
  @JsonKey(name: "LICENSETYPEAAJI")
  Aajicity? licensetypeaaji;
  @JsonKey(name: "REPRINTTYPE")
  City? reprinttype;
  @JsonKey(name: "AZ OFFICEPHONENO")
  Aajicity? azOfficephoneno;
  @JsonKey(name: "PREVCOMPANYAASI")
  Aajicity? prevcompanyaasi;
  @JsonKey(name: "RELATION")
  Aajicity? relation;
  @JsonKey(name: "AZ FAXNO")
  Aajicity? azFaxno;
  @JsonKey(name: "CHECKINGREASON")
  Aajicity? checkingreason;
  @JsonKey(name: "SK STATUS")
  Aajicity? skStatus;
  @JsonKey(name: "AASIEXAMTYPE")
  Aajicity? aasiexamtype;
  @JsonKey(name: "PRODUCTTYPE")
  Aajicity? producttype;
  @JsonKey(name: "AASILICENSETYPE")
  Aajicity? aasilicensetype;
  @JsonKey(name: "BLACKLISTTYPE")
  Aajicity? blacklisttype;
  @JsonKey(name: "HEIRRELATION")
  City? heirrelation;
  @JsonKey(name: "CITY")
  City? city;
  @JsonKey(name: "APPROVALTYPE")
  Aajicity? approvaltype;
  @JsonKey(name: "REINSTATESTATUS")
  Aajicity? reinstatestatus;
  @JsonKey(name: "LICENSETYPE")
  Licensetype? licensetype;
  @JsonKey(name: "PROVINCE")
  Aajicity? province;
  @JsonKey(name: "TITLE")
  Aajicity? title;
  @JsonKey(name: "CPDPROGRAMCATEGORY")
  Aajicity? cpdprogramcategory;
  @JsonKey(name: "EXAMTYPE")
  Aajicity? examtype;
  @JsonKey(name: "AZ EMAIL")
  Aajicity? azEmail;
  @JsonKey(name: "AASIREPRINTTYPE")
  Aajicity? aasireprinttype;

  MasterReferenceAll({
    this.aasiexamtypeAlz,
    this.authentification,
    this.accountpayment,
    this.cpdtrainerstatus,
    this.actimizeblacklisttype,
    this.azWebsite,
    this.cpdprogramtype,
    this.aajitype,
    this.azlicategory,
    this.educationtype,
    this.position,
    this.adminemail,
    this.learningmethodetype,
    this.country,
    this.caoname,
    this.cpdtrainertype,
    this.agentstatusregistration,
    this.azlioename,
    this.emailjob,
    this.aajiprodopustype,
    this.licensetypelist,
    this.statuspayment,
    this.azAddress3,
    this.licenseopustype,
    this.azAddress4,
    this.azAddress5,
    this.azliblacklisttype2,
    this.aajischeduleavailable,
    this.azliblacklisttype1,
    this.idcardtype,
    this.paymentType,
    this.paymenttype,
    this.cpdregisterstatus,
    this.taxtype,
    this.religion,
    this.statusregister,
    this.aajiexamtype,
    this.registerstatus,
    this.signaturedate,
    this.aasiregistertype,
    this.listbank,
    this.azlisdtype,
    this.registertype,
    this.aasiregisterstatus,
    this.sourceinformation,
    this.statusaajilist,
    this.aasiexamtypeNonalz,
    this.aajicity,
    this.approvalname,
    this.statusconfirmation,
    this.checkingstatus,
    this.azliblacklistcategory,
    this.occupationtype,
    this.prevcompany,
    this.producttypeaasi,
    this.examstatus,
    this.toctype,
    this.azAddress1,
    this.azAddress2,
    this.maritalstatus,
    this.gender,
    this.checkingtype,
    this.producttypeaaji,
    this.aajiexamresult,
    this.aasitype,
    this.nationalitytype,
    this.licensetypeaaji,
    this.reprinttype,
    this.azOfficephoneno,
    this.prevcompanyaasi,
    this.relation,
    this.azFaxno,
    this.checkingreason,
    this.skStatus,
    this.aasiexamtype,
    this.producttype,
    this.aasilicensetype,
    this.blacklisttype,
    this.heirrelation,
    this.city,
    this.approvaltype,
    this.reinstatestatus,
    this.licensetype,
    this.province,
    this.title,
    this.cpdprogramcategory,
    this.examtype,
    this.azEmail,
    this.aasireprinttype,
  });

  MasterReferenceAll copyWith({
    Aajicity? aasiexamtypeAlz,
    Aajicity? authentification,
    Aajicity? accountpayment,
    Aajicity? cpdtrainerstatus,
    Aajicity? actimizeblacklisttype,
    Aajicity? azWebsite,
    City? cpdprogramtype,
    Aajicity? aajitype,
    Aajicity? azlicategory,
    City? educationtype,
    Aajicity? position,
    Aajicity? adminemail,
    Aajicity? learningmethodetype,
    Aajicity? country,
    Aajicity? caoname,
    Aajicity? cpdtrainertype,
    Aajicity? agentstatusregistration,
    Aajicity? azlioename,
    Aajicity? emailjob,
    Aajicity? aajiprodopustype,
    Aajicity? licensetypelist,
    Aajicity? statuspayment,
    Aajicity? azAddress3,
    Aajicity? licenseopustype,
    Aajicity? azAddress4,
    Aajicity? azAddress5,
    Aajicity? azliblacklisttype2,
    Aajicity? aajischeduleavailable,
    Aajicity? azliblacklisttype1,
    Aajicity? idcardtype,
    Aajicity? paymentType,
    Aajicity? paymenttype,
    Aajicity? cpdregisterstatus,
    Aajicity? taxtype,
    Aajicity? religion,
    Aajicity? statusregister,
    Aajicity? aajiexamtype,
    Aajicity? registerstatus,
    Aajicity? signaturedate,
    Registertype? aasiregistertype,
    Aajicity? listbank,
    Aajicity? azlisdtype,
    Registertype? registertype,
    Aajicity? aasiregisterstatus,
    Aajicity? sourceinformation,
    Aajicity? statusaajilist,
    Aajicity? aasiexamtypeNonalz,
    Aajicity? aajicity,
    Aajicity? approvalname,
    Aajicity? statusconfirmation,
    Checkingstatus? checkingstatus,
    Aajicity? azliblacklistcategory,
    Checkingstatus? occupationtype,
    Aajicity? prevcompany,
    Aajicity? producttypeaasi,
    Aajicity? examstatus,
    Aajicity? toctype,
    Aajicity? azAddress1,
    Aajicity? azAddress2,
    Aajicity? maritalstatus,
    Aajicity? gender,
    Aajicity? checkingtype,
    Aajicity? producttypeaaji,
    Aajicity? aajiexamresult,
    Aajicity? aasitype,
    Aajicity? nationalitytype,
    Aajicity? licensetypeaaji,
    City? reprinttype,
    Aajicity? azOfficephoneno,
    Aajicity? prevcompanyaasi,
    Aajicity? relation,
    Aajicity? azFaxno,
    Aajicity? checkingreason,
    Aajicity? skStatus,
    Aajicity? aasiexamtype,
    Aajicity? producttype,
    Aajicity? aasilicensetype,
    Aajicity? blacklisttype,
    City? heirrelation,
    City? city,
    Aajicity? approvaltype,
    Aajicity? reinstatestatus,
    Licensetype? licensetype,
    Aajicity? province,
    Aajicity? title,
    Aajicity? cpdprogramcategory,
    Aajicity? examtype,
    Aajicity? azEmail,
    Aajicity? aasireprinttype,
  }) =>
      MasterReferenceAll(
        aasiexamtypeAlz: aasiexamtypeAlz ?? this.aasiexamtypeAlz,
        authentification: authentification ?? this.authentification,
        accountpayment: accountpayment ?? this.accountpayment,
        cpdtrainerstatus: cpdtrainerstatus ?? this.cpdtrainerstatus,
        actimizeblacklisttype: actimizeblacklisttype ?? this.actimizeblacklisttype,
        azWebsite: azWebsite ?? this.azWebsite,
        cpdprogramtype: cpdprogramtype ?? this.cpdprogramtype,
        aajitype: aajitype ?? this.aajitype,
        azlicategory: azlicategory ?? this.azlicategory,
        educationtype: educationtype ?? this.educationtype,
        position: position ?? this.position,
        adminemail: adminemail ?? this.adminemail,
        learningmethodetype: learningmethodetype ?? this.learningmethodetype,
        country: country ?? this.country,
        caoname: caoname ?? this.caoname,
        cpdtrainertype: cpdtrainertype ?? this.cpdtrainertype,
        agentstatusregistration: agentstatusregistration ?? this.agentstatusregistration,
        azlioename: azlioename ?? this.azlioename,
        emailjob: emailjob ?? this.emailjob,
        aajiprodopustype: aajiprodopustype ?? this.aajiprodopustype,
        licensetypelist: licensetypelist ?? this.licensetypelist,
        statuspayment: statuspayment ?? this.statuspayment,
        azAddress3: azAddress3 ?? this.azAddress3,
        licenseopustype: licenseopustype ?? this.licenseopustype,
        azAddress4: azAddress4 ?? this.azAddress4,
        azAddress5: azAddress5 ?? this.azAddress5,
        azliblacklisttype2: azliblacklisttype2 ?? this.azliblacklisttype2,
        aajischeduleavailable: aajischeduleavailable ?? this.aajischeduleavailable,
        azliblacklisttype1: azliblacklisttype1 ?? this.azliblacklisttype1,
        idcardtype: idcardtype ?? this.idcardtype,
        paymentType: paymentType ?? this.paymentType,
        paymenttype: paymenttype ?? this.paymenttype,
        cpdregisterstatus: cpdregisterstatus ?? this.cpdregisterstatus,
        taxtype: taxtype ?? this.taxtype,
        religion: religion ?? this.religion,
        statusregister: statusregister ?? this.statusregister,
        aajiexamtype: aajiexamtype ?? this.aajiexamtype,
        registerstatus: registerstatus ?? this.registerstatus,
        signaturedate: signaturedate ?? this.signaturedate,
        aasiregistertype: aasiregistertype ?? this.aasiregistertype,
        listbank: listbank ?? this.listbank,
        azlisdtype: azlisdtype ?? this.azlisdtype,
        registertype: registertype ?? this.registertype,
        aasiregisterstatus: aasiregisterstatus ?? this.aasiregisterstatus,
        sourceinformation: sourceinformation ?? this.sourceinformation,
        statusaajilist: statusaajilist ?? this.statusaajilist,
        aasiexamtypeNonalz: aasiexamtypeNonalz ?? this.aasiexamtypeNonalz,
        aajicity: aajicity ?? this.aajicity,
        approvalname: approvalname ?? this.approvalname,
        statusconfirmation: statusconfirmation ?? this.statusconfirmation,
        checkingstatus: checkingstatus ?? this.checkingstatus,
        azliblacklistcategory: azliblacklistcategory ?? this.azliblacklistcategory,
        occupationtype: occupationtype ?? this.occupationtype,
        prevcompany: prevcompany ?? this.prevcompany,
        producttypeaasi: producttypeaasi ?? this.producttypeaasi,
        examstatus: examstatus ?? this.examstatus,
        toctype: toctype ?? this.toctype,
        azAddress1: azAddress1 ?? this.azAddress1,
        azAddress2: azAddress2 ?? this.azAddress2,
        maritalstatus: maritalstatus ?? this.maritalstatus,
        gender: gender ?? this.gender,
        checkingtype: checkingtype ?? this.checkingtype,
        producttypeaaji: producttypeaaji ?? this.producttypeaaji,
        aajiexamresult: aajiexamresult ?? this.aajiexamresult,
        aasitype: aasitype ?? this.aasitype,
        nationalitytype: nationalitytype ?? this.nationalitytype,
        licensetypeaaji: licensetypeaaji ?? this.licensetypeaaji,
        reprinttype: reprinttype ?? this.reprinttype,
        azOfficephoneno: azOfficephoneno ?? this.azOfficephoneno,
        prevcompanyaasi: prevcompanyaasi ?? this.prevcompanyaasi,
        relation: relation ?? this.relation,
        azFaxno: azFaxno ?? this.azFaxno,
        checkingreason: checkingreason ?? this.checkingreason,
        skStatus: skStatus ?? this.skStatus,
        aasiexamtype: aasiexamtype ?? this.aasiexamtype,
        producttype: producttype ?? this.producttype,
        aasilicensetype: aasilicensetype ?? this.aasilicensetype,
        blacklisttype: blacklisttype ?? this.blacklisttype,
        heirrelation: heirrelation ?? this.heirrelation,
        city: city ?? this.city,
        approvaltype: approvaltype ?? this.approvaltype,
        reinstatestatus: reinstatestatus ?? this.reinstatestatus,
        licensetype: licensetype ?? this.licensetype,
        province: province ?? this.province,
        title: title ?? this.title,
        cpdprogramcategory: cpdprogramcategory ?? this.cpdprogramcategory,
        examtype: examtype ?? this.examtype,
        azEmail: azEmail ?? this.azEmail,
        aasireprinttype: aasireprinttype ?? this.aasireprinttype,
      );

  factory MasterReferenceAll.fromJson(Map<String, dynamic> json) => _$MasterReferenceAllFromJson(json);

  Map<String, dynamic> toJson() => _$MasterReferenceAllToJson(this);
}

@JsonSerializable()
class Aajicity {
  @JsonKey(name: "masterReference")
  List<AajicityMasterReference>? masterReference;

  Aajicity({
    this.masterReference,
  });

  Aajicity copyWith({
    List<AajicityMasterReference>? masterReference,
  }) =>
      Aajicity(
        masterReference: masterReference ?? this.masterReference,
      );

  factory Aajicity.fromJson(Map<String, dynamic> json) => _$AajicityFromJson(json);

  Map<String, dynamic> toJson() => _$AajicityToJson(this);
}

@JsonSerializable()
class AajicityMasterReference {
  @JsonKey(name: "referToOther")
  String? referToOther;
  @JsonKey(name: "longDescriptionInd")
  String? longDescriptionInd;
  @JsonKey(name: "shortDescriptionEng")
  String? shortDescriptionEng;
  @JsonKey(name: "referTo")
  String? referTo;
  @JsonKey(name: "shortDescriptionInd")
  String? shortDescriptionInd;
  @JsonKey(name: "longDescriptionEng")
  String? longDescriptionEng;
  @JsonKey(name: "id")
  int? id;

  AajicityMasterReference({
    this.referToOther,
    this.longDescriptionInd,
    this.shortDescriptionEng,
    this.referTo,
    this.shortDescriptionInd,
    this.longDescriptionEng,
    this.id,
  });

  AajicityMasterReference copyWith({
    String? referToOther,
    String? longDescriptionInd,
    String? shortDescriptionEng,
    String? referTo,
    String? shortDescriptionInd,
    String? longDescriptionEng,
    int? id,
  }) =>
      AajicityMasterReference(
        referToOther: referToOther ?? this.referToOther,
        longDescriptionInd: longDescriptionInd ?? this.longDescriptionInd,
        shortDescriptionEng: shortDescriptionEng ?? this.shortDescriptionEng,
        referTo: referTo ?? this.referTo,
        shortDescriptionInd: shortDescriptionInd ?? this.shortDescriptionInd,
        longDescriptionEng: longDescriptionEng ?? this.longDescriptionEng,
        id: id ?? this.id,
      );

  factory AajicityMasterReference.fromJson(Map<String, dynamic> json) => _$AajicityMasterReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$AajicityMasterReferenceToJson(this);
}

@JsonSerializable()
class Registertype {
  @JsonKey(name: "masterReference")
  List<AasiregistertypeMasterReference>? masterReference;

  Registertype({
    this.masterReference,
  });

  Registertype copyWith({
    List<AasiregistertypeMasterReference>? masterReference,
  }) =>
      Registertype(
        masterReference: masterReference ?? this.masterReference,
      );

  factory Registertype.fromJson(Map<String, dynamic> json) => _$RegistertypeFromJson(json);

  Map<String, dynamic> toJson() => _$RegistertypeToJson(this);
}

@JsonSerializable()
class AasiregistertypeMasterReference {
  @JsonKey(name: "referToOther")
  dynamic referToOther;
  @JsonKey(name: "longDescriptionInd")
  String? longDescriptionInd;
  @JsonKey(name: "shortDescriptionEng")
  String? shortDescriptionEng;
  @JsonKey(name: "referTo")
  dynamic referTo;
  @JsonKey(name: "shortDescriptionInd")
  String? shortDescriptionInd;
  @JsonKey(name: "longDescriptionEng")
  String? longDescriptionEng;
  @JsonKey(name: "id")
  int? id;

  AasiregistertypeMasterReference({
    this.referToOther,
    this.longDescriptionInd,
    this.shortDescriptionEng,
    this.referTo,
    this.shortDescriptionInd,
    this.longDescriptionEng,
    this.id,
  });

  AasiregistertypeMasterReference copyWith({
    dynamic referToOther,
    String? longDescriptionInd,
    String? shortDescriptionEng,
    dynamic referTo,
    String? shortDescriptionInd,
    String? longDescriptionEng,
    int? id,
  }) =>
      AasiregistertypeMasterReference(
        referToOther: referToOther ?? this.referToOther,
        longDescriptionInd: longDescriptionInd ?? this.longDescriptionInd,
        shortDescriptionEng: shortDescriptionEng ?? this.shortDescriptionEng,
        referTo: referTo ?? this.referTo,
        shortDescriptionInd: shortDescriptionInd ?? this.shortDescriptionInd,
        longDescriptionEng: longDescriptionEng ?? this.longDescriptionEng,
        id: id ?? this.id,
      );

  factory AasiregistertypeMasterReference.fromJson(Map<String, dynamic> json) => _$AasiregistertypeMasterReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$AasiregistertypeMasterReferenceToJson(this);
}

@JsonSerializable()
class Checkingstatus {
  @JsonKey(name: "masterReference")
  List<CheckingstatusMasterReference>? masterReference;

  Checkingstatus({
    this.masterReference,
  });

  Checkingstatus copyWith({
    List<CheckingstatusMasterReference>? masterReference,
  }) =>
      Checkingstatus(
        masterReference: masterReference ?? this.masterReference,
      );

  factory Checkingstatus.fromJson(Map<String, dynamic> json) => _$CheckingstatusFromJson(json);

  Map<String, dynamic> toJson() => _$CheckingstatusToJson(this);
}

@JsonSerializable()
class CheckingstatusMasterReference {
  @JsonKey(name: "referToOther")
  String? referToOther;
  @JsonKey(name: "longDescriptionInd")
  String? longDescriptionInd;
  @JsonKey(name: "shortDescriptionEng")
  String? shortDescriptionEng;
  @JsonKey(name: "referTo")
  dynamic referTo;
  @JsonKey(name: "shortDescriptionInd")
  String? shortDescriptionInd;
  @JsonKey(name: "longDescriptionEng")
  String? longDescriptionEng;
  @JsonKey(name: "id")
  int? id;

  CheckingstatusMasterReference({
    this.referToOther,
    this.longDescriptionInd,
    this.shortDescriptionEng,
    this.referTo,
    this.shortDescriptionInd,
    this.longDescriptionEng,
    this.id,
  });

  CheckingstatusMasterReference copyWith({
    String? referToOther,
    String? longDescriptionInd,
    String? shortDescriptionEng,
    dynamic referTo,
    String? shortDescriptionInd,
    String? longDescriptionEng,
    int? id,
  }) =>
      CheckingstatusMasterReference(
        referToOther: referToOther ?? this.referToOther,
        longDescriptionInd: longDescriptionInd ?? this.longDescriptionInd,
        shortDescriptionEng: shortDescriptionEng ?? this.shortDescriptionEng,
        referTo: referTo ?? this.referTo,
        shortDescriptionInd: shortDescriptionInd ?? this.shortDescriptionInd,
        longDescriptionEng: longDescriptionEng ?? this.longDescriptionEng,
        id: id ?? this.id,
      );

  factory CheckingstatusMasterReference.fromJson(Map<String, dynamic> json) => _$CheckingstatusMasterReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$CheckingstatusMasterReferenceToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: "masterReference")
  List<CityMasterReference>? masterReference;

  City({
    this.masterReference,
  });

  City copyWith({
    List<CityMasterReference>? masterReference,
  }) =>
      City(
        masterReference: masterReference ?? this.masterReference,
      );

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class CityMasterReference {
  @JsonKey(name: "referToOther")
  String? referToOther;
  @JsonKey(name: "longDescriptionInd")
  String? longDescriptionInd;
  @JsonKey(name: "shortDescriptionEng")
  String? shortDescriptionEng;
  @JsonKey(name: "referTo")
  int? referTo;
  @JsonKey(name: "shortDescriptionInd")
  String? shortDescriptionInd;
  @JsonKey(name: "longDescriptionEng")
  String? longDescriptionEng;
  @JsonKey(name: "id")
  int? id;

  CityMasterReference({
    this.referToOther,
    this.longDescriptionInd,
    this.shortDescriptionEng,
    this.referTo,
    this.shortDescriptionInd,
    this.longDescriptionEng,
    this.id,
  });

  CityMasterReference copyWith({
    String? referToOther,
    String? longDescriptionInd,
    String? shortDescriptionEng,
    int? referTo,
    String? shortDescriptionInd,
    String? longDescriptionEng,
    int? id,
  }) =>
      CityMasterReference(
        referToOther: referToOther ?? this.referToOther,
        longDescriptionInd: longDescriptionInd ?? this.longDescriptionInd,
        shortDescriptionEng: shortDescriptionEng ?? this.shortDescriptionEng,
        referTo: referTo ?? this.referTo,
        shortDescriptionInd: shortDescriptionInd ?? this.shortDescriptionInd,
        longDescriptionEng: longDescriptionEng ?? this.longDescriptionEng,
        id: id ?? this.id,
      );

  factory CityMasterReference.fromJson(Map<String, dynamic> json) => _$CityMasterReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$CityMasterReferenceToJson(this);
}

@JsonSerializable()
class Licensetype {
  @JsonKey(name: "masterReference")
  List<LicensetypeMasterReference>? masterReference;

  Licensetype({
    this.masterReference,
  });

  Licensetype copyWith({
    List<LicensetypeMasterReference>? masterReference,
  }) =>
      Licensetype(
        masterReference: masterReference ?? this.masterReference,
      );

  factory Licensetype.fromJson(Map<String, dynamic> json) => _$LicensetypeFromJson(json);

  Map<String, dynamic> toJson() => _$LicensetypeToJson(this);
}

@JsonSerializable()
class LicensetypeMasterReference {
  @JsonKey(name: "referToOther")
  int? referToOther;
  @JsonKey(name: "longDescriptionInd")
  String? longDescriptionInd;
  @JsonKey(name: "shortDescriptionEng")
  String? shortDescriptionEng;
  @JsonKey(name: "referTo")
  String? referTo;
  @JsonKey(name: "shortDescriptionInd")
  String? shortDescriptionInd;
  @JsonKey(name: "longDescriptionEng")
  String? longDescriptionEng;
  @JsonKey(name: "id")
  int? id;

  LicensetypeMasterReference({
    this.referToOther,
    this.longDescriptionInd,
    this.shortDescriptionEng,
    this.referTo,
    this.shortDescriptionInd,
    this.longDescriptionEng,
    this.id,
  });

  LicensetypeMasterReference copyWith({
    int? referToOther,
    String? longDescriptionInd,
    String? shortDescriptionEng,
    String? referTo,
    String? shortDescriptionInd,
    String? longDescriptionEng,
    int? id,
  }) =>
      LicensetypeMasterReference(
        referToOther: referToOther ?? this.referToOther,
        longDescriptionInd: longDescriptionInd ?? this.longDescriptionInd,
        shortDescriptionEng: shortDescriptionEng ?? this.shortDescriptionEng,
        referTo: referTo ?? this.referTo,
        shortDescriptionInd: shortDescriptionInd ?? this.shortDescriptionInd,
        longDescriptionEng: longDescriptionEng ?? this.longDescriptionEng,
        id: id ?? this.id,
      );

  factory LicensetypeMasterReference.fromJson(Map<String, dynamic> json) => _$LicensetypeMasterReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$LicensetypeMasterReferenceToJson(this);
}

@JsonSerializable()
class MasterTocData {
  @JsonKey(name: "tocMaterialAll")
  TocMaterialAll? tocMaterialAll;

  MasterTocData({
    this.tocMaterialAll,
  });

  MasterTocData copyWith({
    TocMaterialAll? tocMaterialAll,
  }) =>
      MasterTocData(
        tocMaterialAll: tocMaterialAll ?? this.tocMaterialAll,
      );

  factory MasterTocData.fromJson(Map<String, dynamic> json) => _$MasterTocDataFromJson(json);

  Map<String, dynamic> toJson() => _$MasterTocDataToJson(this);
}

@JsonSerializable()
class TocMaterialAll {
  @JsonKey(name: "INTERVIEW")
  Interview? interview;
  @JsonKey(name: "PERNYATAAN")
  Jfw? pernyataan;
  @JsonKey(name: "PEMASAR")
  Jfw? pemasar;
  @JsonKey(name: "SETUJU")
  Jfw? setuju;
  @JsonKey(name: "JFW")
  Jfw? jfw;
  @JsonKey(name: "PASAL")
  Jfw? pasal;

  TocMaterialAll({
    this.interview,
    this.pernyataan,
    this.pemasar,
    this.setuju,
    this.jfw,
    this.pasal,
  });

  TocMaterialAll copyWith({
    Interview? interview,
    Jfw? pernyataan,
    Jfw? pemasar,
    Jfw? setuju,
    Jfw? jfw,
    Jfw? pasal,
  }) =>
      TocMaterialAll(
        interview: interview ?? this.interview,
        pernyataan: pernyataan ?? this.pernyataan,
        pemasar: pemasar ?? this.pemasar,
        setuju: setuju ?? this.setuju,
        jfw: jfw ?? this.jfw,
        pasal: pasal ?? this.pasal,
      );

  factory TocMaterialAll.fromJson(Map<String, dynamic> json) => _$TocMaterialAllFromJson(json);

  Map<String, dynamic> toJson() => _$TocMaterialAllToJson(this);
}

@JsonSerializable()
class Interview {
  @JsonKey(name: "tocMaterial")
  List<InterviewTocMaterial>? tocMaterial;

  Interview({
    this.tocMaterial,
  });

  Interview copyWith({
    List<InterviewTocMaterial>? tocMaterial,
  }) =>
      Interview(
        tocMaterial: tocMaterial ?? this.tocMaterial,
      );

  factory Interview.fromJson(Map<String, dynamic> json) => _$InterviewFromJson(json);

  Map<String, dynamic> toJson() => _$InterviewToJson(this);
}

@JsonSerializable()
class InterviewTocMaterial {
  @JsonKey(name: "tocSequence")
  int? tocSequence;
  @JsonKey(name: "tocQuestionInd")
  String? tocQuestionInd;
  @JsonKey(name: "tocQuestionEng")
  String? tocQuestionEng;
  @JsonKey(name: "referTo")
  dynamic referTo;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "choiceA")
  String? choiceA;
  @JsonKey(name: "activeFlag")
  String? activeFlag;
  @JsonKey(name: "choiceB")
  String? choiceB;

  InterviewTocMaterial({
    this.tocSequence,
    this.tocQuestionInd,
    this.tocQuestionEng,
    this.referTo,
    this.description,
    this.id,
    this.choiceA,
    this.activeFlag,
    this.choiceB,
  });

  InterviewTocMaterial copyWith({
    int? tocSequence,
    String? tocQuestionInd,
    String? tocQuestionEng,
    dynamic referTo,
    String? description,
    int? id,
    String? choiceA,
    String? activeFlag,
    String? choiceB,
  }) =>
      InterviewTocMaterial(
        tocSequence: tocSequence ?? this.tocSequence,
        tocQuestionInd: tocQuestionInd ?? this.tocQuestionInd,
        tocQuestionEng: tocQuestionEng ?? this.tocQuestionEng,
        referTo: referTo ?? this.referTo,
        description: description ?? this.description,
        id: id ?? this.id,
        choiceA: choiceA ?? this.choiceA,
        activeFlag: activeFlag ?? this.activeFlag,
        choiceB: choiceB ?? this.choiceB,
      );

  factory InterviewTocMaterial.fromJson(Map<String, dynamic> json) => _$InterviewTocMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$InterviewTocMaterialToJson(this);
}

@JsonSerializable()
class Jfw {
  @JsonKey(name: "tocMaterial")
  List<JfwTocMaterial>? tocMaterial;

  Jfw({
    this.tocMaterial,
  });

  Jfw copyWith({
    List<JfwTocMaterial>? tocMaterial,
  }) =>
      Jfw(
        tocMaterial: tocMaterial ?? this.tocMaterial,
      );

  factory Jfw.fromJson(Map<String, dynamic> json) => _$JfwFromJson(json);

  Map<String, dynamic> toJson() => _$JfwToJson(this);
}

@JsonSerializable()
class JfwTocMaterial {
  @JsonKey(name: "tocSequence")
  int? tocSequence;
  @JsonKey(name: "tocQuestionInd")
  String? tocQuestionInd;
  @JsonKey(name: "tocQuestionEng")
  String? tocQuestionEng;
  @JsonKey(name: "referTo")
  String? referTo;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "choiceA")
  String? choiceA;
  @JsonKey(name: "activeFlag")
  String? activeFlag;
  @JsonKey(name: "choiceB")
  String? choiceB;

  JfwTocMaterial({
    this.tocSequence,
    this.tocQuestionInd,
    this.tocQuestionEng,
    this.referTo,
    this.description,
    this.id,
    this.choiceA,
    this.activeFlag,
    this.choiceB,
  });

  JfwTocMaterial copyWith({
    int? tocSequence,
    String? tocQuestionInd,
    String? tocQuestionEng,
    String? referTo,
    String? description,
    int? id,
    String? choiceA,
    String? activeFlag,
    String? choiceB,
  }) =>
      JfwTocMaterial(
        tocSequence: tocSequence ?? this.tocSequence,
        tocQuestionInd: tocQuestionInd ?? this.tocQuestionInd,
        tocQuestionEng: tocQuestionEng ?? this.tocQuestionEng,
        referTo: referTo ?? this.referTo,
        description: description ?? this.description,
        id: id ?? this.id,
        choiceA: choiceA ?? this.choiceA,
        activeFlag: activeFlag ?? this.activeFlag,
        choiceB: choiceB ?? this.choiceB,
      );

  factory JfwTocMaterial.fromJson(Map<String, dynamic> json) => _$JfwTocMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$JfwTocMaterialToJson(this);
}

@JsonSerializable()
class SupportingDocumentList {
  @JsonKey(name: "supportingDocument")
  List<SupportingDocument>? supportingDocument;

  SupportingDocumentList({
    this.supportingDocument,
  });

  SupportingDocumentList copyWith({
    List<SupportingDocument>? supportingDocument,
  }) =>
      SupportingDocumentList(
        supportingDocument: supportingDocument ?? this.supportingDocument,
      );

  factory SupportingDocumentList.fromJson(Map<String, dynamic> json) => _$SupportingDocumentListFromJson(json);

  Map<String, dynamic> toJson() => _$SupportingDocumentListToJson(this);
}

@JsonSerializable()
class SupportingDocument {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "fileNetId")
  String? fileNetId;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "activeFlag")
  String? activeFlag;

  SupportingDocument({
    this.id,
    this.name,
    this.fileNetId,
    this.description,
    this.activeFlag,
  });

  SupportingDocument copyWith({
    int? id,
    String? name,
    String? fileNetId,
    String? description,
    String? activeFlag,
  }) =>
      SupportingDocument(
        id: id ?? this.id,
        name: name ?? this.name,
        fileNetId: fileNetId ?? this.fileNetId,
        description: description ?? this.description,
        activeFlag: activeFlag ?? this.activeFlag,
      );

  factory SupportingDocument.fromJson(Map<String, dynamic> json) => _$SupportingDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$SupportingDocumentToJson(this);
}
