// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterDataModel _$MasterDataModelFromJson(Map<String, dynamic> json) =>
    MasterDataModel(
      masterData: json['masterData'] == null
          ? null
          : MasterData.fromJson(json['masterData'] as Map<String, dynamic>),
      supportingDocumentList: json['supportingDocumentList'] == null
          ? null
          : SupportingDocumentList.fromJson(
              json['supportingDocumentList'] as Map<String, dynamic>),
      descriptionStatusList: json['descriptionStatusList'] == null
          ? null
          : DescriptionStatusList.fromJson(
              json['descriptionStatusList'] as Map<String, dynamic>),
      masterTocData: json['masterTocData'] == null
          ? null
          : MasterTocData.fromJson(
              json['masterTocData'] as Map<String, dynamic>),
      aajiExamScheduleList: json['aajiExamScheduleList'] == null
          ? null
          : AajiExamScheduleList.fromJson(
              json['aajiExamScheduleList'] as Map<String, dynamic>),
      aajiExamChargeList: json['aajiExamChargeList'] == null
          ? null
          : AajiExamChargeList.fromJson(
              json['aajiExamChargeList'] as Map<String, dynamic>),
      cpdProgramList: json['cpdProgramList'] == null
          ? null
          : CpdProgramList.fromJson(
              json['cpdProgramList'] as Map<String, dynamic>),
      cpdModuleList: json['cpdModuleList'] == null
          ? null
          : CpdModuleList.fromJson(
              json['cpdModuleList'] as Map<String, dynamic>),
      cpdExamChargeList: json['cpdExamChargeList'] == null
          ? null
          : CpdExamChargeList.fromJson(
              json['cpdExamChargeList'] as Map<String, dynamic>),
      cpdElectiveScheduleList: json['cpdElectiveScheduleList'] == null
          ? null
          : CpdElectiveScheduleList.fromJson(
              json['cpdElectiveScheduleList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MasterDataModelToJson(MasterDataModel instance) =>
    <String, dynamic>{
      'masterData': instance.masterData,
      'supportingDocumentList': instance.supportingDocumentList,
      'descriptionStatusList': instance.descriptionStatusList,
      'masterTocData': instance.masterTocData,
      'aajiExamScheduleList': instance.aajiExamScheduleList,
      'aajiExamChargeList': instance.aajiExamChargeList,
      'cpdProgramList': instance.cpdProgramList,
      'cpdModuleList': instance.cpdModuleList,
      'cpdExamChargeList': instance.cpdExamChargeList,
      'cpdElectiveScheduleList': instance.cpdElectiveScheduleList,
    };

AajiExamChargeList _$AajiExamChargeListFromJson(Map<String, dynamic> json) =>
    AajiExamChargeList(
      aajiExamCharge: (json['aajiExamCharge'] as List<dynamic>?)
          ?.map((e) => AajiExamCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AajiExamChargeListToJson(AajiExamChargeList instance) =>
    <String, dynamic>{
      'aajiExamCharge': instance.aajiExamCharge,
    };

AajiExamCharge _$AajiExamChargeFromJson(Map<String, dynamic> json) =>
    AajiExamCharge(
      id: json['id'] as int?,
      aajiType: json['aajiType'] as String?,
      registerStatus: json['registerStatus'] as String?,
      licenseType: json['licenseType'] as String?,
      aajiExamType: json['aajiExamType'] as String?,
      registerType: json['registerType'] as String?,
      reprintType: json['reprintType'] as String?,
      aajiCharge: json['aajiCharge'] as String?,
      activeFlag: json['activeFlag'] as String?,
      createBy: json['createBy'] as String?,
      createDate: json['createDate'] as String?,
      updateBy: json['updateBy'] as String?,
      updateDate: json['updateDate'] as String?,
    );

Map<String, dynamic> _$AajiExamChargeToJson(AajiExamCharge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'aajiType': instance.aajiType,
      'registerStatus': instance.registerStatus,
      'licenseType': instance.licenseType,
      'aajiExamType': instance.aajiExamType,
      'registerType': instance.registerType,
      'reprintType': instance.reprintType,
      'aajiCharge': instance.aajiCharge,
      'activeFlag': instance.activeFlag,
      'createBy': instance.createBy,
      'createDate': instance.createDate,
      'updateBy': instance.updateBy,
      'updateDate': instance.updateDate,
    };

AajiExamScheduleList _$AajiExamScheduleListFromJson(
        Map<String, dynamic> json) =>
    AajiExamScheduleList(
      aajiExamSchedule: (json['aajiExamSchedule'] as List<dynamic>?)
          ?.map((e) => AajiExamSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AajiExamScheduleListToJson(
        AajiExamScheduleList instance) =>
    <String, dynamic>{
      'aajiExamSchedule': instance.aajiExamSchedule,
    };

AajiExamSchedule _$AajiExamScheduleFromJson(Map<String, dynamic> json) =>
    AajiExamSchedule(
      id: json['id'] as int?,
      batchId: json['batchId'] as String?,
      description: json['description'] as String?,
      endTime: json['endTime'] as String?,
      examDate: json['examDate'] as String?,
      examSession: json['examSession'] as String?,
      expiredDate: json['expiredDate'] as String?,
      licenseType: json['licenseType'] as String?,
      licenseTypeId: json['licenseTypeId'] as int?,
      location: json['location'] as String?,
      locationId: json['locationId'] as int?,
      locationName: json['locationName'] as String?,
      quota: json['quota'] as int?,
      startTime: json['startTime'] as String?,
      type: json['type'] as String?,
      typeId: json['typeId'] as int?,
    );

Map<String, dynamic> _$AajiExamScheduleToJson(AajiExamSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batchId': instance.batchId,
      'description': instance.description,
      'endTime': instance.endTime,
      'examDate': instance.examDate,
      'examSession': instance.examSession,
      'expiredDate': instance.expiredDate,
      'licenseType': instance.licenseType,
      'licenseTypeId': instance.licenseTypeId,
      'location': instance.location,
      'locationId': instance.locationId,
      'locationName': instance.locationName,
      'quota': instance.quota,
      'startTime': instance.startTime,
      'type': instance.type,
      'typeId': instance.typeId,
    };

CpdElectiveScheduleList _$CpdElectiveScheduleListFromJson(
        Map<String, dynamic> json) =>
    CpdElectiveScheduleList(
      cpdElectiveSchedule: (json['cpdElectiveSchedule'] as List<dynamic>?)
          ?.map((e) => CpdElectiveSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CpdElectiveScheduleListToJson(
        CpdElectiveScheduleList instance) =>
    <String, dynamic>{
      'cpdElectiveSchedule': instance.cpdElectiveSchedule,
    };

CpdElectiveSchedule _$CpdElectiveScheduleFromJson(Map<String, dynamic> json) =>
    CpdElectiveSchedule(
      id: json['id'] as int?,
      idClass: json['idClass'] as String?,
      className: json['className'] as String?,
      venue: json['venue'] as String?,
      maxParticipant: json['maxParticipant'] as int?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      cpdModuleId: json['cpdModuleId'] as int?,
      idModule: json['idModule'] as String?,
      moduleName: json['moduleName'] as String?,
      idProgram: json['idProgram'] as String?,
      programName: json['programName'] as String?,
      cpdLocationId: json['cpdLocationId'] as int?,
      idLocation: json['idLocation'] as String?,
      locationName: json['locationName'] as String?,
      address: json['address'] as String?,
      cityId: json['cityId'] as int?,
      city: json['city'] as String?,
      idTrainer: json['idTrainer'] as String?,
      trainerName: json['trainerName'] as String?,
      trainerStatus: json['trainerStatus'] as String?,
      certName: json['certName'],
      certYear: json['certYear'],
      certBy: json['certBy'],
      charge: (json['charge'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CpdElectiveScheduleToJson(
        CpdElectiveSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idClass': instance.idClass,
      'className': instance.className,
      'venue': instance.venue,
      'maxParticipant': instance.maxParticipant,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'cpdModuleId': instance.cpdModuleId,
      'idModule': instance.idModule,
      'moduleName': instance.moduleName,
      'idProgram': instance.idProgram,
      'programName': instance.programName,
      'cpdLocationId': instance.cpdLocationId,
      'idLocation': instance.idLocation,
      'locationName': instance.locationName,
      'address': instance.address,
      'cityId': instance.cityId,
      'city': instance.city,
      'idTrainer': instance.idTrainer,
      'trainerName': instance.trainerName,
      'trainerStatus': instance.trainerStatus,
      'certName': instance.certName,
      'certYear': instance.certYear,
      'certBy': instance.certBy,
      'charge': instance.charge,
    };

CpdExamChargeList _$CpdExamChargeListFromJson(Map<String, dynamic> json) =>
    CpdExamChargeList(
      cpdExamCharge: (json['cpdExamCharge'] as List<dynamic>?)
          ?.map((e) => CpdExamCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CpdExamChargeListToJson(CpdExamChargeList instance) =>
    <String, dynamic>{
      'cpdExamCharge': instance.cpdExamCharge,
    };

CpdExamCharge _$CpdExamChargeFromJson(Map<String, dynamic> json) =>
    CpdExamCharge(
      id: json['id'] as int?,
      cpdModuleId: json['cpdModuleId'] as int?,
      cpdModuleCharge: json['cpdModuleCharge'] as int?,
    );

Map<String, dynamic> _$CpdExamChargeToJson(CpdExamCharge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cpdModuleId': instance.cpdModuleId,
      'cpdModuleCharge': instance.cpdModuleCharge,
    };

CpdModuleList _$CpdModuleListFromJson(Map<String, dynamic> json) =>
    CpdModuleList(
      cpdModule: (json['cpdModule'] as List<dynamic>?)
          ?.map((e) => CpdModule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CpdModuleListToJson(CpdModuleList instance) =>
    <String, dynamic>{
      'cpdModule': instance.cpdModule,
    };

CpdModule _$CpdModuleFromJson(Map<String, dynamic> json) => CpdModule(
      id: json['id'] as int?,
      cpdProgramId: json['cpdProgramId'] as int?,
      endDate: json['endDate'] as String?,
      examScore: (json['examScore'] as num?)?.toDouble(),
      examType: json['examType'] as String?,
      learningMethod: json['learningMethod'] as int?,
      name: json['name'] as String?,
      startDate: json['startDate'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$CpdModuleToJson(CpdModule instance) => <String, dynamic>{
      'id': instance.id,
      'cpdProgramId': instance.cpdProgramId,
      'endDate': instance.endDate,
      'examScore': instance.examScore,
      'examType': instance.examType,
      'learningMethod': instance.learningMethod,
      'name': instance.name,
      'startDate': instance.startDate,
      'status': instance.status,
    };

CpdProgramList _$CpdProgramListFromJson(Map<String, dynamic> json) =>
    CpdProgramList(
      cpdProgram: (json['cpdProgram'] as List<dynamic>?)
          ?.map((e) => CpdProgram.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CpdProgramListToJson(CpdProgramList instance) =>
    <String, dynamic>{
      'cpdProgram': instance.cpdProgram,
    };

CpdProgram _$CpdProgramFromJson(Map<String, dynamic> json) => CpdProgram(
      id: json['id'] as int?,
      category: (json['category'] as num?)?.toDouble(),
      idProgram: json['idProgram'] as String?,
      initialProgram: json['initialProgram'] as String?,
      scoreMinimum: (json['scoreMinimum'] as num?)?.toDouble(),
      name: json['name'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      status: json['status'] as int?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CpdProgramToJson(CpdProgram instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'idProgram': instance.idProgram,
      'initialProgram': instance.initialProgram,
      'scoreMinimum': instance.scoreMinimum,
      'name': instance.name,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'status': instance.status,
      'type': instance.type,
    };

DescriptionStatusList _$DescriptionStatusListFromJson(
        Map<String, dynamic> json) =>
    DescriptionStatusList(
      descriptionStatus: (json['descriptionStatus'] as List<dynamic>?)
          ?.map((e) => DescriptionStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DescriptionStatusListToJson(
        DescriptionStatusList instance) =>
    <String, dynamic>{
      'descriptionStatus': instance.descriptionStatus,
    };

DescriptionStatus _$DescriptionStatusFromJson(Map<String, dynamic> json) =>
    DescriptionStatus(
      id: json['id'] as int?,
      tabName: json['tabName'] as String?,
      fieldname: json['fieldname'] as String?,
      descriptionInd: json['descriptionInd'] as String?,
      descriptionEng: json['descriptionEng'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      activeFlag: json['activeFlag'] as String?,
      descriptionType: json['descriptionType'] as String?,
    );

Map<String, dynamic> _$DescriptionStatusToJson(DescriptionStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tabName': instance.tabName,
      'fieldname': instance.fieldname,
      'descriptionInd': instance.descriptionInd,
      'descriptionEng': instance.descriptionEng,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'activeFlag': instance.activeFlag,
      'descriptionType': instance.descriptionType,
    };

MasterData _$MasterDataFromJson(Map<String, dynamic> json) => MasterData(
      masterReferenceAll: json['masterReferenceAll'] == null
          ? null
          : MasterReferenceAll.fromJson(
              json['masterReferenceAll'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MasterDataToJson(MasterData instance) =>
    <String, dynamic>{
      'masterReferenceAll': instance.masterReferenceAll,
    };

MasterReferenceAll _$MasterReferenceAllFromJson(Map<String, dynamic> json) =>
    MasterReferenceAll(
      aasiexamtypeAlz: json['AASIEXAMTYPE-ALZ'] == null
          ? null
          : Aajicity.fromJson(json['AASIEXAMTYPE-ALZ'] as Map<String, dynamic>),
      authentification: json['AUTHENTIFICATION'] == null
          ? null
          : Aajicity.fromJson(json['AUTHENTIFICATION'] as Map<String, dynamic>),
      accountpayment: json['ACCOUNTPAYMENT'] == null
          ? null
          : Aajicity.fromJson(json['ACCOUNTPAYMENT'] as Map<String, dynamic>),
      cpdtrainerstatus: json['CPDTRAINERSTATUS'] == null
          ? null
          : Aajicity.fromJson(json['CPDTRAINERSTATUS'] as Map<String, dynamic>),
      actimizeblacklisttype: json['ACTIMIZEBLACKLISTTYPE'] == null
          ? null
          : Aajicity.fromJson(
              json['ACTIMIZEBLACKLISTTYPE'] as Map<String, dynamic>),
      azWebsite: json['AZ WEBSITE'] == null
          ? null
          : Aajicity.fromJson(json['AZ WEBSITE'] as Map<String, dynamic>),
      cpdprogramtype: json['CPDPROGRAMTYPE'] == null
          ? null
          : City.fromJson(json['CPDPROGRAMTYPE'] as Map<String, dynamic>),
      aajitype: json['AAJITYPE'] == null
          ? null
          : Aajicity.fromJson(json['AAJITYPE'] as Map<String, dynamic>),
      azlicategory: json['AZLICATEGORY'] == null
          ? null
          : Aajicity.fromJson(json['AZLICATEGORY'] as Map<String, dynamic>),
      educationtype: json['EDUCATIONTYPE'] == null
          ? null
          : City.fromJson(json['EDUCATIONTYPE'] as Map<String, dynamic>),
      position: json['POSITION'] == null
          ? null
          : Aajicity.fromJson(json['POSITION'] as Map<String, dynamic>),
      adminemail: json['ADMINEMAIL'] == null
          ? null
          : Aajicity.fromJson(json['ADMINEMAIL'] as Map<String, dynamic>),
      learningmethodetype: json['LEARNINGMETHODETYPE'] == null
          ? null
          : Aajicity.fromJson(
              json['LEARNINGMETHODETYPE'] as Map<String, dynamic>),
      country: json['COUNTRY'] == null
          ? null
          : Aajicity.fromJson(json['COUNTRY'] as Map<String, dynamic>),
      caoname: json['CAONAME'] == null
          ? null
          : Aajicity.fromJson(json['CAONAME'] as Map<String, dynamic>),
      cpdtrainertype: json['CPDTRAINERTYPE'] == null
          ? null
          : Aajicity.fromJson(json['CPDTRAINERTYPE'] as Map<String, dynamic>),
      agentstatusregistration: json['AGENTSTATUSREGISTRATION'] == null
          ? null
          : Aajicity.fromJson(
              json['AGENTSTATUSREGISTRATION'] as Map<String, dynamic>),
      azlioename: json['AZLIOENAME'] == null
          ? null
          : Aajicity.fromJson(json['AZLIOENAME'] as Map<String, dynamic>),
      emailjob: json['EMAILJOB'] == null
          ? null
          : Aajicity.fromJson(json['EMAILJOB'] as Map<String, dynamic>),
      aajiprodopustype: json['AAJIPRODOPUSTYPE'] == null
          ? null
          : Aajicity.fromJson(json['AAJIPRODOPUSTYPE'] as Map<String, dynamic>),
      licensetypelist: json['LICENSETYPELIST'] == null
          ? null
          : Aajicity.fromJson(json['LICENSETYPELIST'] as Map<String, dynamic>),
      statuspayment: json['STATUSPAYMENT'] == null
          ? null
          : Aajicity.fromJson(json['STATUSPAYMENT'] as Map<String, dynamic>),
      azAddress3: json['AZ ADDRESS 3'] == null
          ? null
          : Aajicity.fromJson(json['AZ ADDRESS 3'] as Map<String, dynamic>),
      licenseopustype: json['LICENSEOPUSTYPE'] == null
          ? null
          : Aajicity.fromJson(json['LICENSEOPUSTYPE'] as Map<String, dynamic>),
      azAddress4: json['AZ ADDRESS 4'] == null
          ? null
          : Aajicity.fromJson(json['AZ ADDRESS 4'] as Map<String, dynamic>),
      azAddress5: json['AZ ADDRESS 5'] == null
          ? null
          : Aajicity.fromJson(json['AZ ADDRESS 5'] as Map<String, dynamic>),
      azliblacklisttype2: json['AZLIBLACKLISTTYPE2'] == null
          ? null
          : Aajicity.fromJson(
              json['AZLIBLACKLISTTYPE2'] as Map<String, dynamic>),
      aajischeduleavailable: json['AAJISCHEDULEAVAILABLE'] == null
          ? null
          : Aajicity.fromJson(
              json['AAJISCHEDULEAVAILABLE'] as Map<String, dynamic>),
      azliblacklisttype1: json['AZLIBLACKLISTTYPE1'] == null
          ? null
          : Aajicity.fromJson(
              json['AZLIBLACKLISTTYPE1'] as Map<String, dynamic>),
      idcardtype: json['IDCARDTYPE'] == null
          ? null
          : Aajicity.fromJson(json['IDCARDTYPE'] as Map<String, dynamic>),
      paymentType: json['PAYMENT_TYPE'] == null
          ? null
          : Aajicity.fromJson(json['PAYMENT_TYPE'] as Map<String, dynamic>),
      paymenttype: json['PAYMENTTYPE'] == null
          ? null
          : Aajicity.fromJson(json['PAYMENTTYPE'] as Map<String, dynamic>),
      cpdregisterstatus: json['CPDREGISTERSTATUS'] == null
          ? null
          : Aajicity.fromJson(
              json['CPDREGISTERSTATUS'] as Map<String, dynamic>),
      taxtype: json['TAXTYPE'] == null
          ? null
          : Aajicity.fromJson(json['TAXTYPE'] as Map<String, dynamic>),
      religion: json['RELIGION'] == null
          ? null
          : Aajicity.fromJson(json['RELIGION'] as Map<String, dynamic>),
      statusregister: json['STATUSREGISTER'] == null
          ? null
          : Aajicity.fromJson(json['STATUSREGISTER'] as Map<String, dynamic>),
      aajiexamtype: json['AAJIEXAMTYPE'] == null
          ? null
          : Aajicity.fromJson(json['AAJIEXAMTYPE'] as Map<String, dynamic>),
      registerstatus: json['REGISTERSTATUS'] == null
          ? null
          : Aajicity.fromJson(json['REGISTERSTATUS'] as Map<String, dynamic>),
      signaturedate: json['SIGNATUREDATE'] == null
          ? null
          : Aajicity.fromJson(json['SIGNATUREDATE'] as Map<String, dynamic>),
      aasiregistertype: json['AASIREGISTERTYPE'] == null
          ? null
          : Registertype.fromJson(
              json['AASIREGISTERTYPE'] as Map<String, dynamic>),
      listbank: json['LISTBANK'] == null
          ? null
          : Aajicity.fromJson(json['LISTBANK'] as Map<String, dynamic>),
      azlisdtype: json['AZLISDTYPE'] == null
          ? null
          : Aajicity.fromJson(json['AZLISDTYPE'] as Map<String, dynamic>),
      registertype: json['REGISTERTYPE'] == null
          ? null
          : Registertype.fromJson(json['REGISTERTYPE'] as Map<String, dynamic>),
      aasiregisterstatus: json['AASIREGISTERSTATUS'] == null
          ? null
          : Aajicity.fromJson(
              json['AASIREGISTERSTATUS'] as Map<String, dynamic>),
      sourceinformation: json['SOURCEINFORMATION'] == null
          ? null
          : Aajicity.fromJson(
              json['SOURCEINFORMATION'] as Map<String, dynamic>),
      statusaajilist: json['STATUSAAJILIST'] == null
          ? null
          : Aajicity.fromJson(json['STATUSAAJILIST'] as Map<String, dynamic>),
      aasiexamtypeNonalz: json['AASIEXAMTYPE-NONALZ'] == null
          ? null
          : Aajicity.fromJson(
              json['AASIEXAMTYPE-NONALZ'] as Map<String, dynamic>),
      aajicity: json['AAJICITY'] == null
          ? null
          : Aajicity.fromJson(json['AAJICITY'] as Map<String, dynamic>),
      approvalname: json['APPROVALNAME'] == null
          ? null
          : Aajicity.fromJson(json['APPROVALNAME'] as Map<String, dynamic>),
      statusconfirmation: json['STATUSCONFIRMATION'] == null
          ? null
          : Aajicity.fromJson(
              json['STATUSCONFIRMATION'] as Map<String, dynamic>),
      checkingstatus: json['CHECKINGSTATUS'] == null
          ? null
          : Checkingstatus.fromJson(
              json['CHECKINGSTATUS'] as Map<String, dynamic>),
      azliblacklistcategory: json['AZLIBLACKLISTCATEGORY'] == null
          ? null
          : Aajicity.fromJson(
              json['AZLIBLACKLISTCATEGORY'] as Map<String, dynamic>),
      occupationtype: json['OCCUPATIONTYPE'] == null
          ? null
          : Checkingstatus.fromJson(
              json['OCCUPATIONTYPE'] as Map<String, dynamic>),
      prevcompany: json['PREVCOMPANY'] == null
          ? null
          : Aajicity.fromJson(json['PREVCOMPANY'] as Map<String, dynamic>),
      producttypeaasi: json['PRODUCTTYPEAASI'] == null
          ? null
          : Aajicity.fromJson(json['PRODUCTTYPEAASI'] as Map<String, dynamic>),
      examstatus: json['EXAMSTATUS'] == null
          ? null
          : Aajicity.fromJson(json['EXAMSTATUS'] as Map<String, dynamic>),
      toctype: json['TOCTYPE'] == null
          ? null
          : Aajicity.fromJson(json['TOCTYPE'] as Map<String, dynamic>),
      azAddress1: json['AZ ADDRESS 1'] == null
          ? null
          : Aajicity.fromJson(json['AZ ADDRESS 1'] as Map<String, dynamic>),
      azAddress2: json['AZ ADDRESS 2'] == null
          ? null
          : Aajicity.fromJson(json['AZ ADDRESS 2'] as Map<String, dynamic>),
      maritalstatus: json['MARITALSTATUS'] == null
          ? null
          : Aajicity.fromJson(json['MARITALSTATUS'] as Map<String, dynamic>),
      gender: json['GENDER'] == null
          ? null
          : Aajicity.fromJson(json['GENDER'] as Map<String, dynamic>),
      checkingtype: json['CHECKINGTYPE'] == null
          ? null
          : Aajicity.fromJson(json['CHECKINGTYPE'] as Map<String, dynamic>),
      producttypeaaji: json['PRODUCTTYPEAAJI'] == null
          ? null
          : Aajicity.fromJson(json['PRODUCTTYPEAAJI'] as Map<String, dynamic>),
      aajiexamresult: json['AAJIEXAMRESULT'] == null
          ? null
          : Aajicity.fromJson(json['AAJIEXAMRESULT'] as Map<String, dynamic>),
      aasitype: json['AASITYPE'] == null
          ? null
          : Aajicity.fromJson(json['AASITYPE'] as Map<String, dynamic>),
      nationalitytype: json['NATIONALITYTYPE'] == null
          ? null
          : Aajicity.fromJson(json['NATIONALITYTYPE'] as Map<String, dynamic>),
      licensetypeaaji: json['LICENSETYPEAAJI'] == null
          ? null
          : Aajicity.fromJson(json['LICENSETYPEAAJI'] as Map<String, dynamic>),
      reprinttype: json['REPRINTTYPE'] == null
          ? null
          : City.fromJson(json['REPRINTTYPE'] as Map<String, dynamic>),
      azOfficephoneno: json['AZ OFFICEPHONENO'] == null
          ? null
          : Aajicity.fromJson(json['AZ OFFICEPHONENO'] as Map<String, dynamic>),
      prevcompanyaasi: json['PREVCOMPANYAASI'] == null
          ? null
          : Aajicity.fromJson(json['PREVCOMPANYAASI'] as Map<String, dynamic>),
      relation: json['RELATION'] == null
          ? null
          : Aajicity.fromJson(json['RELATION'] as Map<String, dynamic>),
      azFaxno: json['AZ FAXNO'] == null
          ? null
          : Aajicity.fromJson(json['AZ FAXNO'] as Map<String, dynamic>),
      checkingreason: json['CHECKINGREASON'] == null
          ? null
          : Aajicity.fromJson(json['CHECKINGREASON'] as Map<String, dynamic>),
      skStatus: json['SK STATUS'] == null
          ? null
          : Aajicity.fromJson(json['SK STATUS'] as Map<String, dynamic>),
      aasiexamtype: json['AASIEXAMTYPE'] == null
          ? null
          : Aajicity.fromJson(json['AASIEXAMTYPE'] as Map<String, dynamic>),
      producttype: json['PRODUCTTYPE'] == null
          ? null
          : Aajicity.fromJson(json['PRODUCTTYPE'] as Map<String, dynamic>),
      aasilicensetype: json['AASILICENSETYPE'] == null
          ? null
          : Aajicity.fromJson(json['AASILICENSETYPE'] as Map<String, dynamic>),
      blacklisttype: json['BLACKLISTTYPE'] == null
          ? null
          : Aajicity.fromJson(json['BLACKLISTTYPE'] as Map<String, dynamic>),
      heirrelation: json['HEIRRELATION'] == null
          ? null
          : City.fromJson(json['HEIRRELATION'] as Map<String, dynamic>),
      city: json['CITY'] == null
          ? null
          : City.fromJson(json['CITY'] as Map<String, dynamic>),
      approvaltype: json['APPROVALTYPE'] == null
          ? null
          : Aajicity.fromJson(json['APPROVALTYPE'] as Map<String, dynamic>),
      reinstatestatus: json['REINSTATESTATUS'] == null
          ? null
          : Aajicity.fromJson(json['REINSTATESTATUS'] as Map<String, dynamic>),
      licensetype: json['LICENSETYPE'] == null
          ? null
          : Licensetype.fromJson(json['LICENSETYPE'] as Map<String, dynamic>),
      province: json['PROVINCE'] == null
          ? null
          : Aajicity.fromJson(json['PROVINCE'] as Map<String, dynamic>),
      title: json['TITLE'] == null
          ? null
          : Aajicity.fromJson(json['TITLE'] as Map<String, dynamic>),
      cpdprogramcategory: json['CPDPROGRAMCATEGORY'] == null
          ? null
          : Aajicity.fromJson(
              json['CPDPROGRAMCATEGORY'] as Map<String, dynamic>),
      examtype: json['EXAMTYPE'] == null
          ? null
          : Aajicity.fromJson(json['EXAMTYPE'] as Map<String, dynamic>),
      azEmail: json['AZ EMAIL'] == null
          ? null
          : Aajicity.fromJson(json['AZ EMAIL'] as Map<String, dynamic>),
      aasireprinttype: json['AASIREPRINTTYPE'] == null
          ? null
          : Aajicity.fromJson(json['AASIREPRINTTYPE'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MasterReferenceAllToJson(MasterReferenceAll instance) =>
    <String, dynamic>{
      'AASIEXAMTYPE-ALZ': instance.aasiexamtypeAlz,
      'AUTHENTIFICATION': instance.authentification,
      'ACCOUNTPAYMENT': instance.accountpayment,
      'CPDTRAINERSTATUS': instance.cpdtrainerstatus,
      'ACTIMIZEBLACKLISTTYPE': instance.actimizeblacklisttype,
      'AZ WEBSITE': instance.azWebsite,
      'CPDPROGRAMTYPE': instance.cpdprogramtype,
      'AAJITYPE': instance.aajitype,
      'AZLICATEGORY': instance.azlicategory,
      'EDUCATIONTYPE': instance.educationtype,
      'POSITION': instance.position,
      'ADMINEMAIL': instance.adminemail,
      'LEARNINGMETHODETYPE': instance.learningmethodetype,
      'COUNTRY': instance.country,
      'CAONAME': instance.caoname,
      'CPDTRAINERTYPE': instance.cpdtrainertype,
      'AGENTSTATUSREGISTRATION': instance.agentstatusregistration,
      'AZLIOENAME': instance.azlioename,
      'EMAILJOB': instance.emailjob,
      'AAJIPRODOPUSTYPE': instance.aajiprodopustype,
      'LICENSETYPELIST': instance.licensetypelist,
      'STATUSPAYMENT': instance.statuspayment,
      'AZ ADDRESS 3': instance.azAddress3,
      'LICENSEOPUSTYPE': instance.licenseopustype,
      'AZ ADDRESS 4': instance.azAddress4,
      'AZ ADDRESS 5': instance.azAddress5,
      'AZLIBLACKLISTTYPE2': instance.azliblacklisttype2,
      'AAJISCHEDULEAVAILABLE': instance.aajischeduleavailable,
      'AZLIBLACKLISTTYPE1': instance.azliblacklisttype1,
      'IDCARDTYPE': instance.idcardtype,
      'PAYMENT_TYPE': instance.paymentType,
      'PAYMENTTYPE': instance.paymenttype,
      'CPDREGISTERSTATUS': instance.cpdregisterstatus,
      'TAXTYPE': instance.taxtype,
      'RELIGION': instance.religion,
      'STATUSREGISTER': instance.statusregister,
      'AAJIEXAMTYPE': instance.aajiexamtype,
      'REGISTERSTATUS': instance.registerstatus,
      'SIGNATUREDATE': instance.signaturedate,
      'AASIREGISTERTYPE': instance.aasiregistertype,
      'LISTBANK': instance.listbank,
      'AZLISDTYPE': instance.azlisdtype,
      'REGISTERTYPE': instance.registertype,
      'AASIREGISTERSTATUS': instance.aasiregisterstatus,
      'SOURCEINFORMATION': instance.sourceinformation,
      'STATUSAAJILIST': instance.statusaajilist,
      'AASIEXAMTYPE-NONALZ': instance.aasiexamtypeNonalz,
      'AAJICITY': instance.aajicity,
      'APPROVALNAME': instance.approvalname,
      'STATUSCONFIRMATION': instance.statusconfirmation,
      'CHECKINGSTATUS': instance.checkingstatus,
      'AZLIBLACKLISTCATEGORY': instance.azliblacklistcategory,
      'OCCUPATIONTYPE': instance.occupationtype,
      'PREVCOMPANY': instance.prevcompany,
      'PRODUCTTYPEAASI': instance.producttypeaasi,
      'EXAMSTATUS': instance.examstatus,
      'TOCTYPE': instance.toctype,
      'AZ ADDRESS 1': instance.azAddress1,
      'AZ ADDRESS 2': instance.azAddress2,
      'MARITALSTATUS': instance.maritalstatus,
      'GENDER': instance.gender,
      'CHECKINGTYPE': instance.checkingtype,
      'PRODUCTTYPEAAJI': instance.producttypeaaji,
      'AAJIEXAMRESULT': instance.aajiexamresult,
      'AASITYPE': instance.aasitype,
      'NATIONALITYTYPE': instance.nationalitytype,
      'LICENSETYPEAAJI': instance.licensetypeaaji,
      'REPRINTTYPE': instance.reprinttype,
      'AZ OFFICEPHONENO': instance.azOfficephoneno,
      'PREVCOMPANYAASI': instance.prevcompanyaasi,
      'RELATION': instance.relation,
      'AZ FAXNO': instance.azFaxno,
      'CHECKINGREASON': instance.checkingreason,
      'SK STATUS': instance.skStatus,
      'AASIEXAMTYPE': instance.aasiexamtype,
      'PRODUCTTYPE': instance.producttype,
      'AASILICENSETYPE': instance.aasilicensetype,
      'BLACKLISTTYPE': instance.blacklisttype,
      'HEIRRELATION': instance.heirrelation,
      'CITY': instance.city,
      'APPROVALTYPE': instance.approvaltype,
      'REINSTATESTATUS': instance.reinstatestatus,
      'LICENSETYPE': instance.licensetype,
      'PROVINCE': instance.province,
      'TITLE': instance.title,
      'CPDPROGRAMCATEGORY': instance.cpdprogramcategory,
      'EXAMTYPE': instance.examtype,
      'AZ EMAIL': instance.azEmail,
      'AASIREPRINTTYPE': instance.aasireprinttype,
    };

Aajicity _$AajicityFromJson(Map<String, dynamic> json) => Aajicity(
      masterReference: (json['masterReference'] as List<dynamic>?)
          ?.map((e) =>
              AajicityMasterReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AajicityToJson(Aajicity instance) => <String, dynamic>{
      'masterReference': instance.masterReference,
    };

AajicityMasterReference _$AajicityMasterReferenceFromJson(
        Map<String, dynamic> json) =>
    AajicityMasterReference(
      referToOther: json['referToOther'] as String?,
      longDescriptionInd: json['longDescriptionInd'] as String?,
      shortDescriptionEng: json['shortDescriptionEng'] as String?,
      referTo: json['referTo'] as String?,
      shortDescriptionInd: json['shortDescriptionInd'] as String?,
      longDescriptionEng: json['longDescriptionEng'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$AajicityMasterReferenceToJson(
        AajicityMasterReference instance) =>
    <String, dynamic>{
      'referToOther': instance.referToOther,
      'longDescriptionInd': instance.longDescriptionInd,
      'shortDescriptionEng': instance.shortDescriptionEng,
      'referTo': instance.referTo,
      'shortDescriptionInd': instance.shortDescriptionInd,
      'longDescriptionEng': instance.longDescriptionEng,
      'id': instance.id,
    };

Registertype _$RegistertypeFromJson(Map<String, dynamic> json) => Registertype(
      masterReference: (json['masterReference'] as List<dynamic>?)
          ?.map((e) => AasiregistertypeMasterReference.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegistertypeToJson(Registertype instance) =>
    <String, dynamic>{
      'masterReference': instance.masterReference,
    };

AasiregistertypeMasterReference _$AasiregistertypeMasterReferenceFromJson(
        Map<String, dynamic> json) =>
    AasiregistertypeMasterReference(
      referToOther: json['referToOther'],
      longDescriptionInd: json['longDescriptionInd'] as String?,
      shortDescriptionEng: json['shortDescriptionEng'] as String?,
      referTo: json['referTo'],
      shortDescriptionInd: json['shortDescriptionInd'] as String?,
      longDescriptionEng: json['longDescriptionEng'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$AasiregistertypeMasterReferenceToJson(
        AasiregistertypeMasterReference instance) =>
    <String, dynamic>{
      'referToOther': instance.referToOther,
      'longDescriptionInd': instance.longDescriptionInd,
      'shortDescriptionEng': instance.shortDescriptionEng,
      'referTo': instance.referTo,
      'shortDescriptionInd': instance.shortDescriptionInd,
      'longDescriptionEng': instance.longDescriptionEng,
      'id': instance.id,
    };

Checkingstatus _$CheckingstatusFromJson(Map<String, dynamic> json) =>
    Checkingstatus(
      masterReference: (json['masterReference'] as List<dynamic>?)
          ?.map((e) =>
              CheckingstatusMasterReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckingstatusToJson(Checkingstatus instance) =>
    <String, dynamic>{
      'masterReference': instance.masterReference,
    };

CheckingstatusMasterReference _$CheckingstatusMasterReferenceFromJson(
        Map<String, dynamic> json) =>
    CheckingstatusMasterReference(
      referToOther: json['referToOther'] as String?,
      longDescriptionInd: json['longDescriptionInd'] as String?,
      shortDescriptionEng: json['shortDescriptionEng'] as String?,
      referTo: json['referTo'],
      shortDescriptionInd: json['shortDescriptionInd'] as String?,
      longDescriptionEng: json['longDescriptionEng'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CheckingstatusMasterReferenceToJson(
        CheckingstatusMasterReference instance) =>
    <String, dynamic>{
      'referToOther': instance.referToOther,
      'longDescriptionInd': instance.longDescriptionInd,
      'shortDescriptionEng': instance.shortDescriptionEng,
      'referTo': instance.referTo,
      'shortDescriptionInd': instance.shortDescriptionInd,
      'longDescriptionEng': instance.longDescriptionEng,
      'id': instance.id,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      masterReference: (json['masterReference'] as List<dynamic>?)
          ?.map((e) => CityMasterReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'masterReference': instance.masterReference,
    };

CityMasterReference _$CityMasterReferenceFromJson(Map<String, dynamic> json) =>
    CityMasterReference(
      referToOther: json['referToOther'] as String?,
      longDescriptionInd: json['longDescriptionInd'] as String?,
      shortDescriptionEng: json['shortDescriptionEng'] as String?,
      referTo: json['referTo'] as int?,
      shortDescriptionInd: json['shortDescriptionInd'] as String?,
      longDescriptionEng: json['longDescriptionEng'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CityMasterReferenceToJson(
        CityMasterReference instance) =>
    <String, dynamic>{
      'referToOther': instance.referToOther,
      'longDescriptionInd': instance.longDescriptionInd,
      'shortDescriptionEng': instance.shortDescriptionEng,
      'referTo': instance.referTo,
      'shortDescriptionInd': instance.shortDescriptionInd,
      'longDescriptionEng': instance.longDescriptionEng,
      'id': instance.id,
    };

Licensetype _$LicensetypeFromJson(Map<String, dynamic> json) => Licensetype(
      masterReference: (json['masterReference'] as List<dynamic>?)
          ?.map((e) =>
              LicensetypeMasterReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LicensetypeToJson(Licensetype instance) =>
    <String, dynamic>{
      'masterReference': instance.masterReference,
    };

LicensetypeMasterReference _$LicensetypeMasterReferenceFromJson(
        Map<String, dynamic> json) =>
    LicensetypeMasterReference(
      referToOther: json['referToOther'] as int?,
      longDescriptionInd: json['longDescriptionInd'] as String?,
      shortDescriptionEng: json['shortDescriptionEng'] as String?,
      referTo: json['referTo'] as String?,
      shortDescriptionInd: json['shortDescriptionInd'] as String?,
      longDescriptionEng: json['longDescriptionEng'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$LicensetypeMasterReferenceToJson(
        LicensetypeMasterReference instance) =>
    <String, dynamic>{
      'referToOther': instance.referToOther,
      'longDescriptionInd': instance.longDescriptionInd,
      'shortDescriptionEng': instance.shortDescriptionEng,
      'referTo': instance.referTo,
      'shortDescriptionInd': instance.shortDescriptionInd,
      'longDescriptionEng': instance.longDescriptionEng,
      'id': instance.id,
    };

MasterTocData _$MasterTocDataFromJson(Map<String, dynamic> json) =>
    MasterTocData(
      tocMaterialAll: json['tocMaterialAll'] == null
          ? null
          : TocMaterialAll.fromJson(
              json['tocMaterialAll'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MasterTocDataToJson(MasterTocData instance) =>
    <String, dynamic>{
      'tocMaterialAll': instance.tocMaterialAll,
    };

TocMaterialAll _$TocMaterialAllFromJson(Map<String, dynamic> json) =>
    TocMaterialAll(
      interview: json['INTERVIEW'] == null
          ? null
          : Interview.fromJson(json['INTERVIEW'] as Map<String, dynamic>),
      pernyataan: json['PERNYATAAN'] == null
          ? null
          : Jfw.fromJson(json['PERNYATAAN'] as Map<String, dynamic>),
      pemasar: json['PEMASAR'] == null
          ? null
          : Jfw.fromJson(json['PEMASAR'] as Map<String, dynamic>),
      setuju: json['SETUJU'] == null
          ? null
          : Jfw.fromJson(json['SETUJU'] as Map<String, dynamic>),
      jfw: json['JFW'] == null
          ? null
          : Jfw.fromJson(json['JFW'] as Map<String, dynamic>),
      pasal: json['PASAL'] == null
          ? null
          : Jfw.fromJson(json['PASAL'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TocMaterialAllToJson(TocMaterialAll instance) =>
    <String, dynamic>{
      'INTERVIEW': instance.interview,
      'PERNYATAAN': instance.pernyataan,
      'PEMASAR': instance.pemasar,
      'SETUJU': instance.setuju,
      'JFW': instance.jfw,
      'PASAL': instance.pasal,
    };

Interview _$InterviewFromJson(Map<String, dynamic> json) => Interview(
      tocMaterial: (json['tocMaterial'] as List<dynamic>?)
          ?.map((e) => InterviewTocMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InterviewToJson(Interview instance) => <String, dynamic>{
      'tocMaterial': instance.tocMaterial,
    };

InterviewTocMaterial _$InterviewTocMaterialFromJson(
        Map<String, dynamic> json) =>
    InterviewTocMaterial(
      tocSequence: json['tocSequence'] as int?,
      tocQuestionInd: json['tocQuestionInd'] as String?,
      tocQuestionEng: json['tocQuestionEng'] as String?,
      referTo: json['referTo'],
      description: json['description'] as String?,
      id: json['id'] as int?,
      choiceA: json['choiceA'] as String?,
      activeFlag: json['activeFlag'] as String?,
      choiceB: json['choiceB'] as String?,
    );

Map<String, dynamic> _$InterviewTocMaterialToJson(
        InterviewTocMaterial instance) =>
    <String, dynamic>{
      'tocSequence': instance.tocSequence,
      'tocQuestionInd': instance.tocQuestionInd,
      'tocQuestionEng': instance.tocQuestionEng,
      'referTo': instance.referTo,
      'description': instance.description,
      'id': instance.id,
      'choiceA': instance.choiceA,
      'activeFlag': instance.activeFlag,
      'choiceB': instance.choiceB,
    };

Jfw _$JfwFromJson(Map<String, dynamic> json) => Jfw(
      tocMaterial: (json['tocMaterial'] as List<dynamic>?)
          ?.map((e) => JfwTocMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JfwToJson(Jfw instance) => <String, dynamic>{
      'tocMaterial': instance.tocMaterial,
    };

JfwTocMaterial _$JfwTocMaterialFromJson(Map<String, dynamic> json) =>
    JfwTocMaterial(
      tocSequence: json['tocSequence'] as int?,
      tocQuestionInd: json['tocQuestionInd'] as String?,
      tocQuestionEng: json['tocQuestionEng'] as String?,
      referTo: json['referTo'] as String?,
      description: json['description'] as String?,
      id: json['id'] as int?,
      choiceA: json['choiceA'] as String?,
      activeFlag: json['activeFlag'] as String?,
      choiceB: json['choiceB'] as String?,
    );

Map<String, dynamic> _$JfwTocMaterialToJson(JfwTocMaterial instance) =>
    <String, dynamic>{
      'tocSequence': instance.tocSequence,
      'tocQuestionInd': instance.tocQuestionInd,
      'tocQuestionEng': instance.tocQuestionEng,
      'referTo': instance.referTo,
      'description': instance.description,
      'id': instance.id,
      'choiceA': instance.choiceA,
      'activeFlag': instance.activeFlag,
      'choiceB': instance.choiceB,
    };

SupportingDocumentList _$SupportingDocumentListFromJson(
        Map<String, dynamic> json) =>
    SupportingDocumentList(
      supportingDocument: (json['supportingDocument'] as List<dynamic>?)
          ?.map((e) => SupportingDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SupportingDocumentListToJson(
        SupportingDocumentList instance) =>
    <String, dynamic>{
      'supportingDocument': instance.supportingDocument,
    };

SupportingDocument _$SupportingDocumentFromJson(Map<String, dynamic> json) =>
    SupportingDocument(
      id: json['id'] as int?,
      name: json['name'] as String?,
      fileNetId: json['fileNetId'] as String?,
      description: json['description'] as String?,
      activeFlag: json['activeFlag'] as String?,
    );

Map<String, dynamic> _$SupportingDocumentToJson(SupportingDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fileNetId': instance.fileNetId,
      'description': instance.description,
      'activeFlag': instance.activeFlag,
    };
