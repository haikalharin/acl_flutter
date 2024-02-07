part of 'faa_candidate_page_bloc.dart';

class FaaCandidatePageState with FormzMixin {
  final FormzSubmissionStatus submitStatus;
  final String? message;
  final TabType tabType;
  final MandatoryFieldValidator firstName;
  final MandatoryFieldValidator middleName;
  final MandatoryFieldValidator lastName;
  final AajicityMasterReference? position;
  final DropdownFieldValidator positionId;
  final IdentityNoValidator identityNo;
  final AajicityMasterReference? martialStatus;
  final DropdownFieldValidator martialStatusId;
  final MandatoryFieldValidator pob;
  final MandatoryFieldValidator dob;
  final AajicityMasterReference? gender;
  final DropdownFieldValidator genderId;
  final MandatoryFieldValidator nationality;
  final AajicityMasterReference? religion;
  final DropdownFieldValidator religionId;
  final MandatoryFieldValidator address;
  final MandatoryFieldValidator rtRw;
  final MandatoryFieldValidator kecKel;
  final ZipcodeValidator postalCode;
  final AajicityMasterReference? country;
  final DropdownFieldValidator countryId;
  final AajicityMasterReference? province;
  final DropdownFieldValidator provinceId;
  final CityMasterReference? city;
  final DropdownFieldValidator cityId;

  final MandatoryFieldValidator identityImage;
  final MandatoryFieldValidator identitySelfieImage;
  final IdentityNoValidator kkNo;
  final MandatoryFieldValidator kkImage;


  final CheckingstatusMasterReference? occupation;
  final DropdownFieldValidator occupationId;
  final MandatoryFieldValidator noLicenceAAJI;
  final MandatoryFieldValidator imageLicenceAAJI;
  final MandatoryFieldValidator noLicenceAASI;
  final MandatoryFieldValidator imageLicenceAASI;
  final MandatoryFieldValidator noLicenceAAUI;
  final MandatoryFieldValidator imageLicenceAAUI;
  final MandatoryFieldValidator firstNamePartner;
  final MandatoryFieldValidator middleNamePartner;
  final MandatoryFieldValidator lastNamePartner;
  final MandatoryFieldValidator dobPartner;
  final IdentityNoValidator identityNoPartner;

  final AajicityMasterReference? relation;
  final DropdownFieldValidator relationId;
  final String? moveTo;
  final MasterDataModel? masterDataModel;
  final CandidateModel? candidateModel;
  final CandidateRegisterModel? candidateRegisterModel;
  final CandidateDataModel? candidateDataModel;
  final bool checkedValueAAJI;
  final bool checkedValueAASI;
  final bool checkedNeedValueAAUI;
  final bool checkedValueAAUI;
  final bool checkedValueMarriage;

  ///Work Experience

  final bool isJustAddExperience;
  final MandatoryFieldValidator checkIsEmployee;
  final MandatoryFieldValidator statusEmployee;
  final MandatoryFieldValidator unitName;
  final MandatoryFieldValidator lastDepartment;
  final MandatoryFieldValidator directLeader;
  final MandatoryFieldValidator companyName;
  final MandatoryFieldValidator companyType;
  final MandatoryFieldValidator department;
  final bool checkedStillWorking;
  final MandatoryFieldValidator startWorking;
  final DateTime? startWorkingDate;
  final MandatoryFieldValidator endWorking;
  final DateTime? endWorkingDate;
  final AddCompanyModel? addCompanyModel;

  ///Education
  final bool isJustAddEducation;
  final AddEducationModel? addEducationModel;
  final DropdownFieldValidator educationLevelId;
  final CityMasterReference? educationLevel;
  final MandatoryFieldValidator educationPlaceName;
  final MandatoryFieldValidator educationDescription;
  final MandatoryFieldValidator educationStatus;
  final bool checkedStillLearning;
  final MandatoryFieldValidator educationStart;
  final DateTime? educationStartDate;
  final MandatoryFieldValidator educationEnd;
  final DateTime? educationEndDate;

  const FaaCandidatePageState({
    this.message = '',
    this.tabType = TabType.private,
    this.isJustAddEducation = false,
    this.educationLevelId = const DropdownFieldValidator.pure(),
    this.educationLevel,
    this.educationPlaceName = const MandatoryFieldValidator.pure(),
    this.educationDescription = const MandatoryFieldValidator.pure(),
    this.educationStatus = const MandatoryFieldValidator.pure(),
    this.educationStart = const MandatoryFieldValidator.pure(),
    this.educationEnd = const MandatoryFieldValidator.pure(),
    this.educationStartDate,
    this.educationEndDate,
    this.checkedStillLearning = false,
    this.unitName = const MandatoryFieldValidator.pure(),
    this.lastDepartment = const MandatoryFieldValidator.pure(),
    this.directLeader = const MandatoryFieldValidator.pure(),
    this.checkIsEmployee = const MandatoryFieldValidator.pure(),
    this.statusEmployee = const MandatoryFieldValidator.pure(),
    this.companyName = const MandatoryFieldValidator.pure(),
    this.companyType = const MandatoryFieldValidator.pure(),
    this.department = const MandatoryFieldValidator.pure(),
    this.checkedStillWorking = false,
    this.startWorking = const MandatoryFieldValidator.pure(),
    this.startWorkingDate,
    this.endWorking = const MandatoryFieldValidator.pure(),
    this.endWorkingDate,
    this.addCompanyModel,
    this.isJustAddExperience = false,

    ///private data
    this.firstName = const MandatoryFieldValidator.pure(),
    this.middleName = const MandatoryFieldValidator.pure(),
    this.lastName = const MandatoryFieldValidator.pure(),
    this.position,
    this.positionId = const DropdownFieldValidator.pure(),
    this.identityNo = const IdentityNoValidator.pure(),
    this.martialStatus,
    this.martialStatusId = const DropdownFieldValidator.pure(),
    this.pob = const MandatoryFieldValidator.pure(),
    this.dob = const MandatoryFieldValidator.pure(),
    this.gender,
    this.genderId = const DropdownFieldValidator.pure(),
    this.nationality = const MandatoryFieldValidator.pure(),
    this.religion,
    this.religionId = const DropdownFieldValidator.pure(),
    this.address = const MandatoryFieldValidator.pure(),
    this.rtRw = const MandatoryFieldValidator.pure(),
    this.kecKel = const MandatoryFieldValidator.pure(),
    this.postalCode = const ZipcodeValidator.pure(),
    this.country,
    this.countryId = const DropdownFieldValidator.pure(),
    this.province,
    this.provinceId = const DropdownFieldValidator.pure(),
    this.city,
    this.cityId = const DropdownFieldValidator.pure(),

    ///private data
    this.identityImage = const MandatoryFieldValidator.pure(),
    this.identitySelfieImage = const MandatoryFieldValidator.pure(),
    this.kkNo = const IdentityNoValidator.pure(),
    this.kkImage = const MandatoryFieldValidator.pure(),


    this.occupation,
    this.occupationId = const DropdownFieldValidator.pure(),
    this.noLicenceAAJI = const MandatoryFieldValidator.pure(),
    this.imageLicenceAAJI = const MandatoryFieldValidator.pure(),
    this.noLicenceAASI = const MandatoryFieldValidator.pure(),
    this.imageLicenceAASI = const MandatoryFieldValidator.pure(),
    this.noLicenceAAUI = const MandatoryFieldValidator.pure(),
    this.imageLicenceAAUI = const MandatoryFieldValidator.pure(),
    this.firstNamePartner = const MandatoryFieldValidator.pure(),
    this.middleNamePartner = const MandatoryFieldValidator.pure(),
    this.lastNamePartner = const MandatoryFieldValidator.pure(),
    this.dobPartner = const MandatoryFieldValidator.pure(),
    this.identityNoPartner = const IdentityNoValidator.pure(),
    this.relation,
    this.relationId = const DropdownFieldValidator.pure(),
    this.masterDataModel,
    this.candidateModel,
    this.candidateRegisterModel,
    this.candidateDataModel,
    this.moveTo,
    this.checkedValueAAJI = false,
    this.checkedValueAASI = false,
    this.checkedNeedValueAAUI = false,
    this.checkedValueAAUI = false,
    this.checkedValueMarriage = false,
    this.addEducationModel,
    this.submitStatus = FormzSubmissionStatus.initial,
  });

  @override
  List<FormzInput> get inputs {
    List<FormzInput> data = [];

    if (tabType == TabType.experience) {
      if (isJustAddExperience) {
        data.clear();
        data.add(companyName);
        data.add(companyType);
        data.add(department);
        data.add(startWorking);
        data.add(endWorking);
      } else if (checkIsEmployee.value == 'Ya') {
        data.clear();
        data.add(checkIsEmployee);
        data.add(unitName);
        data.add(lastDepartment);
        data.add(directLeader);
        data.add(statusEmployee);
      } else {
        data.clear();
        data.add(checkIsEmployee);
      }
    } else if (tabType == TabType.education) {
      if (isJustAddEducation) {
        data.clear();
        data.add(educationLevelId);
        data.add(educationPlaceName);
        data.add(educationDescription);
        data.add(educationStart);
        data.add(educationEnd);
        data.add(educationStatus);
      } else {
        data.clear();
      }
    } else {
      data.clear();
    }
    return data;
  }

  FaaCandidatePageState copyWith({
    String? message,
    TabType? tabType,
    bool? isJustAddExperience,
    bool? isJustAddEducation,
    AddEducationModel? addEducationModel,
    DropdownFieldValidator? educationLevelId,
    CityMasterReference? educationLevel,
    MandatoryFieldValidator? educationPlaceName,
    MandatoryFieldValidator? educationDescription,
    MandatoryFieldValidator? educationStatus,
    MandatoryFieldValidator? educationStart,
    DateTime? educationStartDate,
    MandatoryFieldValidator? educationEnd,
    DateTime? educationEndDate,
    bool? checkedStillLearning,
    MandatoryFieldValidator? checkIsEmployee,
    MandatoryFieldValidator? unitName,
    MandatoryFieldValidator? lastDepartment,
    MandatoryFieldValidator? directLeader,
    MandatoryFieldValidator? companyName,
    MandatoryFieldValidator? companyType,
    MandatoryFieldValidator? department,
    bool? checkedStillWorking,
    MandatoryFieldValidator? startWorking,
    DateTime? startWorkingDate,
    MandatoryFieldValidator? endWorking,
    DateTime? endWorkingDate,
    AddCompanyModel? addCompanyModel,

    ///Private data
    MandatoryFieldValidator? firstName,
    MandatoryFieldValidator? middleName,
    MandatoryFieldValidator? lastName,
    AajicityMasterReference? position,
    DropdownFieldValidator? positionId,
    IdentityNoValidator? identityNo,
    AajicityMasterReference? martialStatus,
    DropdownFieldValidator? martialStatusId,
    MandatoryFieldValidator? pob,
    MandatoryFieldValidator? dob,
    AajicityMasterReference? gender,
    DropdownFieldValidator? genderId,
    MandatoryFieldValidator? nationality,
    AajicityMasterReference? religion,
    DropdownFieldValidator? religionId,
    MandatoryFieldValidator? address,
    MandatoryFieldValidator? rtRw,
    MandatoryFieldValidator? kecKel,
    ZipcodeValidator? postalCode,
    AajicityMasterReference? country,
    DropdownFieldValidator? countryId,
    AajicityMasterReference? province,
    DropdownFieldValidator? provinceId,
    CityMasterReference? city,
    DropdownFieldValidator? cityId,


    ///
    MandatoryFieldValidator? identityImage,
    MandatoryFieldValidator? identitySelfieImage,
    IdentityNoValidator? kkNo,
    MandatoryFieldValidator? kkImage,

    CheckingstatusMasterReference? occupation,
    DropdownFieldValidator? occupationId,
    MandatoryFieldValidator? noLicenceAAJI,
    MandatoryFieldValidator? imageLicenceAAJI,
    MandatoryFieldValidator? noLicenceAASI,
    MandatoryFieldValidator? imageLicenceAASI,
    MandatoryFieldValidator? noLicenceAAUI,
    MandatoryFieldValidator? imageLicenceAAUI,
    MandatoryFieldValidator? firstNamePartner,
    MandatoryFieldValidator? middleNamePartner,
    MandatoryFieldValidator? lastNamePartner,
    MandatoryFieldValidator? dobPartner,
    IdentityNoValidator? identityNoPartner,
    AajicityMasterReference? relation,
    DropdownFieldValidator? relationId,
    MasterDataModel? masterDataModel,
    String? moveTo,
    bool? checkedValueAAJI,
    bool? checkedValueAASI,
    bool? checkedNeedValueAAUI,
    bool? checkedValueAAUI,
    bool? checkedValueMarriage,
    CandidateModel? candidateModel,
    CandidateRegisterModel? candidateRegisterModel,
    CandidateDataModel? candidateDataModel,
    FormzSubmissionStatus? submitStatus,
  }) {
    // MandatoryFieldValidator? educationLevel,
    //     MandatoryFieldValidator? educationPlaceName,
    // MandatoryFieldValidator? educationDescription,
    // MandatoryFieldValidator? educationStatus,
    // MandatoryFieldValidator? educationStart,
    // DateTime? educationStartDate,
    // MandatoryFieldValidator? educationEnd,
    // DateTime? educationEndDate,
    return FaaCandidatePageState(
      message: message,
      isJustAddExperience: isJustAddExperience ?? this.isJustAddExperience,
      isJustAddEducation: isJustAddEducation ?? this.isJustAddEducation,
      tabType: tabType ?? this.tabType,
      addEducationModel: addEducationModel ?? this.addEducationModel,
      educationLevelId: educationLevelId ?? this.educationLevelId,
      educationLevel: educationLevel ?? this.educationLevel,
      educationPlaceName: educationPlaceName ?? this.educationPlaceName,
      educationDescription: educationDescription ?? this.educationDescription,
      educationStatus: educationStatus ?? this.educationStatus,
      educationStart: educationStart ?? this.educationStart,
      educationStartDate: educationStartDate ?? this.educationStartDate,
      educationEnd: educationEnd ?? this.educationEnd,
      educationEndDate: educationEndDate ?? this.educationEndDate,
      checkedStillLearning: checkedStillLearning ?? this.checkedStillLearning,
      checkIsEmployee: checkIsEmployee ?? this.checkIsEmployee,
      unitName: unitName ?? this.unitName,
      lastDepartment: lastDepartment ?? this.lastDepartment,
      directLeader: directLeader ?? this.directLeader,
      companyName: companyName ?? this.companyName,
      companyType: companyType ?? this.companyType,
      department: department ?? this.department,
      checkedStillWorking: checkedStillWorking ?? this.checkedStillWorking,
      startWorking: startWorking ?? this.startWorking,
      startWorkingDate: startWorkingDate ?? this.startWorkingDate,
      endWorking: endWorking ?? this.endWorking,
      endWorkingDate: endWorkingDate ?? this.endWorkingDate,
      addCompanyModel: addCompanyModel ?? this.addCompanyModel,

      ///private data
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      position: position ?? this.position,
      positionId: positionId ?? this.positionId,
      identityNo: identityNo ?? this.identityNo,
      martialStatus: martialStatus ?? this.martialStatus,
      martialStatusId: martialStatusId ?? this.martialStatusId,
      pob: pob ?? this.pob,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      genderId: genderId ?? this.genderId,
      nationality: nationality ?? this.nationality,
      religion: religion ?? this.religion,
      religionId: religionId ?? this.religionId,
      address: address ?? this.address,
      rtRw: rtRw ?? this.rtRw,
      kecKel: kecKel ?? this.kecKel,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      countryId: countryId ?? this.countryId,
      province: province ?? this.province,
      provinceId: provinceId ?? this.provinceId,
      city: city ?? this.city,
      cityId: cityId ?? this.cityId,


      ///
      identityImage: identityImage ?? this.identityImage,
      identitySelfieImage: identitySelfieImage ?? this.identitySelfieImage,
      kkNo: kkNo ?? this.kkNo,
      kkImage: kkImage ?? this.kkImage,
      occupation: occupation ?? this.occupation,
      occupationId: occupationId ?? this.occupationId,
      noLicenceAAJI: noLicenceAAJI ?? this.noLicenceAAJI,
      imageLicenceAAJI: imageLicenceAAJI ?? this.imageLicenceAAJI,
      noLicenceAASI: noLicenceAASI ?? this.noLicenceAASI,
      imageLicenceAASI: imageLicenceAASI ?? this.imageLicenceAASI,
      noLicenceAAUI: noLicenceAAUI ?? this.noLicenceAAUI,
      imageLicenceAAUI: imageLicenceAAUI ?? this.imageLicenceAAUI,
      firstNamePartner: firstNamePartner ?? this.firstNamePartner,
      middleNamePartner: middleNamePartner ?? this.middleNamePartner,
      lastNamePartner: lastNamePartner ?? this.lastNamePartner,
      dobPartner: dobPartner ?? this.dobPartner,
      identityNoPartner: identityNoPartner ?? this.identityNoPartner,
      relation: relation ?? this.relation,
      relationId: relationId ?? this.relationId,
      masterDataModel: masterDataModel ?? this.masterDataModel,
      candidateModel: candidateModel ?? this.candidateModel,
      candidateDataModel: candidateDataModel ?? this.candidateDataModel,
      candidateRegisterModel:
          candidateRegisterModel ?? this.candidateRegisterModel,
      moveTo: moveTo ?? this.moveTo,
      checkedValueAAJI: checkedValueAAJI ?? this.checkedValueAAJI,
      checkedValueAASI: checkedValueAASI ?? this.checkedValueAASI,
      checkedNeedValueAAUI: checkedNeedValueAAUI ?? this.checkedNeedValueAAUI,
      checkedValueAAUI: checkedValueAAUI ?? this.checkedValueAAUI,
      checkedValueMarriage: checkedValueMarriage ?? this.checkedValueMarriage,
      submitStatus: submitStatus ?? this.submitStatus,
    );
  }
}

class AddAgentPageInitial extends FaaCandidatePageState {}

class AddCompanyModel {
  AddCompanyModel({
    this.companyName,
    this.companyType,
    this.department,
    this.checkedStillWorking,
    this.startWorking,
    this.startWorkingDate,
    this.endWorking,
    this.endWorkingDate,
  });

  String? companyName;
  String? companyType;
  String? department;
  bool? checkedStillWorking;
  String? startWorking;
  DateTime? startWorkingDate;
  String? endWorking;
  DateTime? endWorkingDate;
}

class AddEducationModel {
  AddEducationModel({
    this.level,
    this.schoolName,
    this.description,
    this.checkedStillLearning,
    this.startLearning,
    this.startLearningDate,
    this.endLearning,
    this.endLearningDate,
    this.status,
  });

  int? level;
  String? schoolName;
  String? description;
  bool? checkedStillLearning;
  String? startLearning;
  DateTime? startLearningDate;
  String? endLearning;
  DateTime? endLearningDate;
  String? status;
}

enum TabType { private, experience, education }
