part of 'faa_candidate_page_bloc.dart';

class FaaCandidatePageState with FormzMixin {
  final FormzSubmissionStatus submitStatus;
  final String? message;
  final TabType tabType;
  final PutDataType putDataType;
  final String? moveTo;
  final MasterDataModel? masterDataModel;
  final CandidateModel? candidateModel;
  final CandidateRegisterModel? candidateRegisterModel;
  final CandidateDataModel? candidateDataModel;
  final FamilyCardModel? candidateDataFamilyModel;

  ///Private Data
  final MandatoryFieldValidator firstName;
  final MandatoryFieldValidator middleName;
  final MandatoryFieldValidator lastName;
  final AajicityMasterReference? position;
  final DropdownFieldValidator positionId;
  final IdentityNoValidator identityNo;
  final AajicityMasterReference? martialStatus;
  final DropdownFieldValidator martialStatusId;
  final MandatoryFieldValidator pob;
  final MandatoryFieldValidator dobString;
  final DateTime? dob;
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
  final PhoneValidator phone;
  final HandphoneValidator handphone;
  final EmailValidator email;
  final CheckingstatusMasterReference? occupation;
  final DropdownFieldValidator occupationId;
  final MandatoryFieldValidator lastWorkExperience;
  final DateTime? lastResignDate;
  final MandatoryFieldValidator lastResignDateString;
  final DateTime? terminationDate;
  final MandatoryFieldValidator terminationDateString;
  final MandatoryFieldValidator privateImage;
  final MandatoryFieldValidator identityImage;
  final MandatoryFieldValidator identitySelfieImage;
  final MandatoryFieldValidator terminationImage;
  final MandatoryFieldValidator notTwistingImage;
  final MandatoryFieldValidator heirsName;
  final CityMasterReference? heirsRelation;
  final DropdownFieldValidator heirsRelationId;
  final MandatoryFieldValidator noLicenceAAJI;
  final MandatoryFieldValidator imageLicenceAAJI;
  final MandatoryFieldValidator noLicenceAASI;
  final MandatoryFieldValidator imageLicenceAASI;
  final MandatoryFieldValidator noLicenceAAUI;
  final MandatoryFieldValidator imageLicenceAAUI;
  final MandatoryFieldValidator npwpNo;
  final MandatoryFieldValidator bankNo;
  final MandatoryFieldValidator bankUserName;
  final DropdownFieldValidator bankNameId;
  final AajicityMasterReference? bankName;
  final MandatoryFieldValidator bankBranch;
  final MandatoryFieldValidator npwpImage;
  final MandatoryFieldValidator bankUserBookImage;
  final MandatoryFieldValidator sourceInformation;
  final SupportingDocument? appendixValue;
  final DropdownFieldValidator appendixValueId;
  final MandatoryFieldValidator appendixImage;
  final bool checkedValueTermination;
  final bool checkedValueLastResign;
  final bool checkedValueAAJI;
  final bool checkedValueAASI;
  final bool checkedValueAAUI;
  final bool checkedPrevCompanyValueAAJI;
  final bool checkedPrevCompanyValueAASI;
  final bool checkedPrevCompanyValueAAUI;
  final AajicityMasterReference? prevCompanyAAJI;
  final DropdownFieldValidator prevCompanyAAJIId;
  final AajicityMasterReference? prevCompanyAASI;
  final DropdownFieldValidator prevCompanyAASIId;
  final AajicityMasterReference? prevCompanyAAUI;
  final DropdownFieldValidator prevCompanyAAUIId;
  final bool checkedLastDateValueAAJI;
  final MandatoryFieldValidator dateLastDateValueAAJIString;
  final DateTime? dateLastDateValueAAJI;
  final MandatoryFieldValidator terminationValueAAJIImage;
  final MandatoryFieldValidator notTwistingValueAAJIImage;
  final MandatoryFieldValidator mobileActivationExamValueAAJIImage;
  final bool checkedLastDateValueAASI;
  final MandatoryFieldValidator dateLastDateValueAASIString;
  final DateTime? dateLastDateValueAASI;
  final MandatoryFieldValidator terminationValueAASIImage;
  final MandatoryFieldValidator notTwistingValueAASIImage;
  final MandatoryFieldValidator mobileActivationExamValueAASIImage;

  final bool checkedLastDateValueAAUI;
  final MandatoryFieldValidator dateLastDateValueAAUIString;
  final DateTime? dateLastDateValueAAUI;
  final MandatoryFieldValidator terminationValueAAUIImage;
  final MandatoryFieldValidator notTwistingValueAAUIImage;
  final MandatoryFieldValidator mobileActivationExamValueAAUIImage;

  final MandatoryFieldValidator firstNamePartner;
  final AajicityMasterReference? relation;
  final DropdownFieldValidator relationId;
  final MandatoryFieldValidator spouseIsAgent;
  final MandatoryFieldValidator directUnitName;
  final AajicityMasterReference? spousePosition;
  final DropdownFieldValidator spousePositionId;
  final MandatoryFieldValidator agentCode;

  ///Spouse and family
  final List<ResponseFamiliesData>? listFamilyIsAgent;
  final List<ResponseFamiliesData>? listFamilyIsAgentOthers;
  final List<ResponseFamiliesData>? listFamilyIsEmploye;
  final List<RelationInCompanyModel>? listFamilyIsAgentDelete;
  final MandatoryFieldValidator familyPersonName;
  final DropdownFieldValidator familyPersonRelationId;
  final CityMasterReference? familyPersonRelation;
  final MandatoryFieldValidator familyDirectName;
  final DropdownFieldValidator familyPositionId;
  final AajicityMasterReference? familyPosition;
  final MandatoryFieldValidator familyAgentCode;
  final MandatoryFieldValidator familyDepartment;
  final MandatoryFieldValidator familyCompany;

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

  final IdentityNoValidator kkNo;
  final MandatoryFieldValidator kkImage;

  final MandatoryFieldValidator middleNamePartner;
  final MandatoryFieldValidator lastNamePartner;
  final MandatoryFieldValidator dobPartner;
  final IdentityNoValidator identityNoPartner;

  final bool checkedNeedValueAAUI;
  final bool checkedValueMarriage;

  const FaaCandidatePageState({
    this.message = '',
    this.tabType = TabType.private,
    this.putDataType = PutDataType.isInit,
    this.moveTo,
    this.masterDataModel,
    this.candidateModel,
    this.candidateRegisterModel,
    this.candidateDataModel,
    this.addEducationModel,
    this.candidateDataFamilyModel,
    this.checkedValueLastResign = false,
    this.checkedValueTermination = false,
    this.submitStatus = FormzSubmissionStatus.initial,

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
    this.dobString = const MandatoryFieldValidator.pure(),
    this.dob,
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
    this.phone = const PhoneValidator.pure(),
    this.handphone = const HandphoneValidator.pure(),
    this.email = const EmailValidator.pure(),
    this.occupation,
    this.occupationId = const DropdownFieldValidator.pure(),
    this.lastWorkExperience = const MandatoryFieldValidator.pure(),
    this.lastResignDate,
    this.lastResignDateString = const MandatoryFieldValidator.pure(),
    this.terminationDate,
    this.terminationDateString = const MandatoryFieldValidator.pure(),
    this.privateImage = const MandatoryFieldValidator.pure(),
    this.identityImage = const MandatoryFieldValidator.pure(),
    this.identitySelfieImage = const MandatoryFieldValidator.pure(),
    this.terminationImage = const MandatoryFieldValidator.pure(),
    this.notTwistingImage = const MandatoryFieldValidator.pure(),
    this.heirsName = const MandatoryFieldValidator.pure(),
    this.noLicenceAAJI = const MandatoryFieldValidator.pure(),
    this.imageLicenceAAJI = const MandatoryFieldValidator.pure(),
    this.noLicenceAASI = const MandatoryFieldValidator.pure(),
    this.imageLicenceAASI = const MandatoryFieldValidator.pure(),
    this.noLicenceAAUI = const MandatoryFieldValidator.pure(),
    this.imageLicenceAAUI = const MandatoryFieldValidator.pure(),
    this.npwpNo = const MandatoryFieldValidator.pure(),
    this.bankNo = const MandatoryFieldValidator.pure(),
    this.bankUserName = const MandatoryFieldValidator.pure(),
    this.bankName,
    this.bankNameId = const DropdownFieldValidator.pure(),
    this.bankBranch = const MandatoryFieldValidator.pure(),
    this.npwpImage = const MandatoryFieldValidator.pure(),
    this.bankUserBookImage = const MandatoryFieldValidator.pure(),
    this.sourceInformation = const MandatoryFieldValidator.pure(),
    this.appendixValue,
    this.appendixValueId = const DropdownFieldValidator.pure(),
    this.appendixImage = const MandatoryFieldValidator.pure(),
    this.prevCompanyAAJI,
    this.prevCompanyAAJIId = const DropdownFieldValidator.pure(),
    this.prevCompanyAASI,
    this.prevCompanyAASIId = const DropdownFieldValidator.pure(),
    this.prevCompanyAAUI,
    this.prevCompanyAAUIId = const DropdownFieldValidator.pure(),
    this.checkedPrevCompanyValueAAJI = false,
    this.checkedPrevCompanyValueAASI = false,
    this.checkedPrevCompanyValueAAUI = false,
    this.checkedLastDateValueAAJI = false,
    this.dateLastDateValueAAJIString = const MandatoryFieldValidator.pure(),
    this.dateLastDateValueAAJI,
    this.terminationValueAAJIImage = const MandatoryFieldValidator.pure(),
    this.notTwistingValueAAJIImage = const MandatoryFieldValidator.pure(),
    this.mobileActivationExamValueAAJIImage =
        const MandatoryFieldValidator.pure(),
    this.checkedLastDateValueAASI = false,
    this.dateLastDateValueAASIString = const MandatoryFieldValidator.pure(),
    this.dateLastDateValueAASI,
    this.terminationValueAASIImage = const MandatoryFieldValidator.pure(),
    this.notTwistingValueAASIImage = const MandatoryFieldValidator.pure(),
    this.mobileActivationExamValueAASIImage =
        const MandatoryFieldValidator.pure(),
    this.checkedLastDateValueAAUI = false,
    this.dateLastDateValueAAUIString = const MandatoryFieldValidator.pure(),
    this.dateLastDateValueAAUI,
    this.terminationValueAAUIImage = const MandatoryFieldValidator.pure(),
    this.notTwistingValueAAUIImage = const MandatoryFieldValidator.pure(),
    this.mobileActivationExamValueAAUIImage =
        const MandatoryFieldValidator.pure(),
    this.firstNamePartner = const MandatoryFieldValidator.pure(),
    this.heirsRelation,
    this.heirsRelationId = const DropdownFieldValidator.pure(),
    this.spouseIsAgent = const MandatoryFieldValidator.pure(),
    this.directUnitName = const MandatoryFieldValidator.pure(),
    this.spousePosition,
    this.spousePositionId = const DropdownFieldValidator.pure(),
    this.agentCode = const MandatoryFieldValidator.pure(),

    ///Spouse and family
    this.listFamilyIsAgent,
    this.listFamilyIsAgentOthers,
    this.listFamilyIsEmploye,
    this.listFamilyIsAgentDelete,
    this.familyPersonName = const MandatoryFieldValidator.pure(),
    this.familyPersonRelationId = const DropdownFieldValidator.pure(),
    this.familyPersonRelation,
    this.familyDirectName = const MandatoryFieldValidator.pure(),
    this.familyPositionId = const DropdownFieldValidator.pure(),
    this.familyPosition,
    this.familyAgentCode = const MandatoryFieldValidator.pure(),
    this.familyDepartment = const MandatoryFieldValidator.pure(),
    this.familyCompany = const MandatoryFieldValidator.pure(),

    ///Education
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

    ///Work Experience
    this.isJustAddExperience = false,
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
    this.kkNo = const IdentityNoValidator.pure(),
    this.kkImage = const MandatoryFieldValidator.pure(),
    this.middleNamePartner = const MandatoryFieldValidator.pure(),
    this.lastNamePartner = const MandatoryFieldValidator.pure(),
    this.dobPartner = const MandatoryFieldValidator.pure(),
    this.identityNoPartner = const IdentityNoValidator.pure(),
    this.relation,
    this.relationId = const DropdownFieldValidator.pure(),
    this.checkedValueAAJI = false,
    this.checkedValueAASI = false,
    this.checkedNeedValueAAUI = false,
    this.checkedValueAAUI = false,
    this.checkedValueMarriage = false,
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
      }
    } else if (tabType == TabType.private) {
      if (putDataType == PutDataType.isAgentInAllianz) {
        data.clear();
      } else if (putDataType == PutDataType.isAgentInOthers) {
        data.clear();
      } else if (putDataType == PutDataType.isEmployeeInAllianz) {
        data.clear();
      } else {
        data.clear();
        data.addAll([
          firstName,
          middleName,
          lastName,
          positionId,
          identityNo,
          martialStatusId,
          pob,
          dobString,
          genderId,
          nationality,
          religionId,
          address,
          rtRw,
          kecKel,
          postalCode,
          countryId,
          provinceId,
          cityId,
          phone,
          handphone,
          email,
          occupationId,
          lastWorkExperience,
          privateImage,
          identityImage,
          identitySelfieImage,
          terminationImage,
          notTwistingImage,
          heirsName,
          heirsRelationId,
          npwpNo,
          bankNo,
          bankUserName,
          bankNameId,
          bankBranch,
          npwpImage,
          bankUserBookImage,
          sourceInformation,
          appendixValueId,
          appendixImage,
          spouseIsAgent,
          firstNamePartner,
          relationId,
          directUnitName,
          spousePositionId,
          agentCode,
        ]);
        if (checkedValueAAJI) {
          if (checkedPrevCompanyValueAAJI) {
            data.add(prevCompanyAAJIId);
          } else {
            data.remove(prevCompanyAAJIId);
          }
          data.addAll([
            noLicenceAAJI,
            imageLicenceAAJI,
          ]);
        } else {
          data.remove(noLicenceAAJI);
          data.remove(noLicenceAAJI);
        }
        if (checkedValueAASI) {
          if (checkedPrevCompanyValueAASI) {
            data.add(prevCompanyAASIId);
          } else {
            data.remove(prevCompanyAASIId);
          }
          data.addAll([
            noLicenceAASI,
            imageLicenceAASI,
          ]);
        } else {
          data.remove(noLicenceAASI);
          data.remove(imageLicenceAASI);
        }
        if (checkedValueAAUI) {
          if (checkedPrevCompanyValueAAUI) {
            data.add(prevCompanyAAUIId);
          } else {
            data.remove(prevCompanyAAUIId);
          }
          data.addAll([
            noLicenceAAUI,
            imageLicenceAAUI,
          ]);
        } else {
          data.remove(noLicenceAAUI);
          data.remove(imageLicenceAAUI);
        }
        if (checkedValueLastResign) {
          data.addAll([
            lastResignDateString,
            terminationDateString,
          ]);
        } else {
          data.remove(lastResignDateString);
          data.remove(terminationDateString);
        }
      }
    }
    return data;
  }

  FaaCandidatePageState copyWith({
    String? message,
    TabType? tabType,
    String? moveTo,
    MasterDataModel? masterDataModel,
    CandidateModel? candidateModel,
    CandidateRegisterModel? candidateRegisterModel,
    CandidateDataModel? candidateDataModel,
    FamilyCardModel? candidateDataFamilyModel,
    bool? checkedValueTermination,
    bool? checkedValueLastResign,
    FormzSubmissionStatus? submitStatus,

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
    DateTime? dob,
    MandatoryFieldValidator? dobString,
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
    PhoneValidator? phone,
    HandphoneValidator? handphone,
    EmailValidator? email,
    CheckingstatusMasterReference? occupation,
    DropdownFieldValidator? occupationId,
    MandatoryFieldValidator? lastWorkExperience,
    DateTime? lastResignDate,
    MandatoryFieldValidator? lastResignDateString,
    DateTime? terminationDate,
    MandatoryFieldValidator? terminationDateString,
    MandatoryFieldValidator? privateImage,
    MandatoryFieldValidator? identityImage,
    MandatoryFieldValidator? identitySelfieImage,
    MandatoryFieldValidator? terminationImage,
    MandatoryFieldValidator? notTwistingImage,
    MandatoryFieldValidator? heirsName,
    CityMasterReference? heirsRelation,
    DropdownFieldValidator? heirsRelationId,
    MandatoryFieldValidator? noLicenceAAJI,
    MandatoryFieldValidator? imageLicenceAAJI,
    MandatoryFieldValidator? noLicenceAASI,
    MandatoryFieldValidator? imageLicenceAASI,
    MandatoryFieldValidator? noLicenceAAUI,
    MandatoryFieldValidator? imageLicenceAAUI,
    MandatoryFieldValidator? npwpNo,
    MandatoryFieldValidator? bankNo,
    MandatoryFieldValidator? bankUserName,
    AajicityMasterReference? bankName,
    DropdownFieldValidator? bankNameId,
    MandatoryFieldValidator? bankBranch,
    MandatoryFieldValidator? npwpImage,
    MandatoryFieldValidator? bankUserBookImage,
    MandatoryFieldValidator? sourceInformation,
    MandatoryFieldValidator? appendixImage,
    DropdownFieldValidator? appendixValueId,
    SupportingDocument? appendixValue,
    bool? checkedPrevCompanyValueAAJI,
    bool? checkedPrevCompanyValueAASI,
    bool? checkedPrevCompanyValueAAUI,
    AajicityMasterReference? prevCompanyAAJI,
    DropdownFieldValidator? prevCompanyAAJIId,
    AajicityMasterReference? prevCompanyAASI,
    DropdownFieldValidator? prevCompanyAASIId,
    AajicityMasterReference? prevCompanyAAUI,
    DropdownFieldValidator? prevCompanyAAUIId,
    bool? checkedLastDateValueAAJI,
    MandatoryFieldValidator? dateLastDateValueAAJIString,
    DateTime? dateLastDateValueAAJI,
    MandatoryFieldValidator? terminationValueAAJIImage,
    MandatoryFieldValidator? notTwistingValueAAJIImage,
    MandatoryFieldValidator? mobileActivationExamValueAAJIImage,
    bool? checkedLastDateValueAASI,
    MandatoryFieldValidator? dateLastDateValueAASIString,
    DateTime? dateLastDateValueAASI,
    MandatoryFieldValidator? terminationValueAASIImage,
    MandatoryFieldValidator? notTwistingValueAASIImage,
    MandatoryFieldValidator? mobileActivationExamValueAASIImage,
    bool? checkedLastDateValueAAUI,
    MandatoryFieldValidator? dateLastDateValueAAUIString,
    DateTime? dateLastDateValueAAUI,
    MandatoryFieldValidator? terminationValueAAUIImage,
    MandatoryFieldValidator? notTwistingValueAAUIImage,
    MandatoryFieldValidator? mobileActivationExamValueAAUIImage,
    MandatoryFieldValidator? spouseIsAgent,
    MandatoryFieldValidator? firstNamePartner,
    AajicityMasterReference? relation,
    DropdownFieldValidator? relationId,
    MandatoryFieldValidator? directUnitName,
    AajicityMasterReference? spousePosition,
    DropdownFieldValidator? spousePositionId,
    MandatoryFieldValidator? agentCode,

    ///Spouse and family

    PutDataType? putDataType,
    List<ResponseFamiliesData>? listFamilyIsAgent,
    List<ResponseFamiliesData>? listFamilyIsAgentOthers,
    List<ResponseFamiliesData>? listFamilyIsEmployee,
    List<RelationInCompanyModel>? listFamilyIsAgentDelete,
    MandatoryFieldValidator? familyPersonName,
    DropdownFieldValidator? familyPersonRelationId,
    CityMasterReference? familyPersonRelation,
    MandatoryFieldValidator? familyDirectName,
    DropdownFieldValidator? familyPositionId,
    AajicityMasterReference? familyPosition,
    MandatoryFieldValidator? familyAgentCode,
    MandatoryFieldValidator? familyDepartment,
    MandatoryFieldValidator? familyCompany,

    ///Education
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

    ///Experience
    bool? isJustAddExperience,
    MandatoryFieldValidator? checkIsEmployee,
    MandatoryFieldValidator? statusEmployee,
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

    ///

    IdentityNoValidator? kkNo,
    MandatoryFieldValidator? kkImage,
    MandatoryFieldValidator? middleNamePartner,
    MandatoryFieldValidator? lastNamePartner,
    MandatoryFieldValidator? dobPartner,
    IdentityNoValidator? identityNoPartner,
    bool? checkedValueAAJI,
    bool? checkedValueAASI,
    bool? checkedNeedValueAAUI,
    bool? checkedValueAAUI,
    bool? checkedValueMarriage,
  }) {
    return FaaCandidatePageState(
      message: message,
      masterDataModel: masterDataModel ?? this.masterDataModel,
      candidateModel: candidateModel ?? this.candidateModel,
      candidateDataModel: candidateDataModel ?? this.candidateDataModel,
      candidateDataFamilyModel:
          candidateDataFamilyModel ?? this.candidateDataFamilyModel,
      candidateRegisterModel:
          candidateRegisterModel ?? this.candidateRegisterModel,
      moveTo: moveTo ?? this.moveTo,
      tabType: tabType ?? this.tabType,
      checkedValueTermination:
          checkedValueTermination ?? this.checkedValueTermination,
      checkedValueLastResign:
          checkedValueLastResign ?? this.checkedValueLastResign,

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
      dobString: dobString ?? this.dobString,
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
      phone: phone ?? this.phone,
      handphone: handphone ?? this.handphone,
      email: email ?? this.email,
      occupation: occupation ?? this.occupation,
      occupationId: occupationId ?? this.occupationId,
      lastWorkExperience: lastWorkExperience ?? this.lastWorkExperience,
      lastResignDate: lastResignDate ?? this.lastResignDate,
      lastResignDateString: lastResignDateString ?? this.lastResignDateString,
      terminationDate: terminationDate ?? this.terminationDate,
      terminationDateString:
          terminationDateString ?? this.terminationDateString,
      privateImage: privateImage ?? this.privateImage,
      identityImage: identityImage ?? this.identityImage,
      identitySelfieImage: identitySelfieImage ?? this.identitySelfieImage,
      terminationImage: terminationImage ?? this.terminationImage,
      notTwistingImage: notTwistingImage ?? this.notTwistingImage,
      heirsName: heirsName ?? this.heirsName,
      heirsRelation: heirsRelation ?? this.heirsRelation,
      heirsRelationId: heirsRelationId ?? this.heirsRelationId,
      noLicenceAAJI: noLicenceAAJI ?? this.noLicenceAAJI,
      imageLicenceAAJI: imageLicenceAAJI ?? this.imageLicenceAAJI,
      noLicenceAASI: noLicenceAASI ?? this.noLicenceAASI,
      imageLicenceAASI: imageLicenceAASI ?? this.imageLicenceAASI,
      noLicenceAAUI: noLicenceAAUI ?? this.noLicenceAAUI,
      imageLicenceAAUI: imageLicenceAAUI ?? this.imageLicenceAAUI,
      npwpNo: npwpNo ?? this.npwpNo,
      bankNo: bankNo ?? this.bankNo,
      bankUserName: bankUserName ?? this.bankUserName,
      bankName: bankName ?? this.bankName,
      bankNameId: bankNameId ?? this.bankNameId,
      bankBranch: bankBranch ?? this.bankBranch,
      npwpImage: npwpImage ?? this.npwpImage,
      bankUserBookImage: bankUserBookImage ?? this.bankUserBookImage,
      sourceInformation: sourceInformation ?? this.sourceInformation,
      appendixValue: appendixValue ?? this.appendixValue,
      appendixValueId: appendixValueId ?? this.appendixValueId,
      appendixImage: appendixImage ?? this.appendixImage,
      checkedPrevCompanyValueAAJI:
          checkedPrevCompanyValueAAJI ?? this.checkedPrevCompanyValueAAJI,
      checkedPrevCompanyValueAASI:
          checkedPrevCompanyValueAASI ?? this.checkedPrevCompanyValueAASI,
      checkedPrevCompanyValueAAUI:
          checkedPrevCompanyValueAAUI ?? this.checkedPrevCompanyValueAAUI,
      prevCompanyAAJI: prevCompanyAAJI ?? this.prevCompanyAAJI,
      prevCompanyAAJIId: prevCompanyAAJIId ?? this.prevCompanyAAJIId,
      prevCompanyAASI: prevCompanyAASI ?? this.prevCompanyAASI,
      prevCompanyAASIId: prevCompanyAASIId ?? this.prevCompanyAASIId,
      prevCompanyAAUI: prevCompanyAAUI ?? this.prevCompanyAAUI,
      prevCompanyAAUIId: prevCompanyAAUIId ?? this.prevCompanyAAUIId,
      checkedLastDateValueAAJI:
          checkedLastDateValueAAJI ?? this.checkedLastDateValueAAJI,
      dateLastDateValueAAJIString:
          dateLastDateValueAAJIString ?? this.dateLastDateValueAAJIString,
      dateLastDateValueAAJI:
          dateLastDateValueAAJI ?? this.dateLastDateValueAAJI,
      terminationValueAAJIImage:
          terminationValueAAJIImage ?? this.terminationValueAAJIImage,
      notTwistingValueAAJIImage:
          notTwistingValueAAJIImage ?? this.notTwistingValueAAJIImage,
      mobileActivationExamValueAAJIImage: mobileActivationExamValueAAJIImage ??
          this.mobileActivationExamValueAAJIImage,

      checkedLastDateValueAASI:
          checkedLastDateValueAASI ?? this.checkedPrevCompanyValueAASI,
      dateLastDateValueAASIString:
          dateLastDateValueAASIString ?? this.dateLastDateValueAASIString,
      dateLastDateValueAASI:
          dateLastDateValueAASI ?? this.dateLastDateValueAASI,
      terminationValueAASIImage:
          terminationValueAASIImage ?? this.terminationValueAASIImage,
      notTwistingValueAASIImage:
          notTwistingValueAASIImage ?? this.notTwistingValueAASIImage,
      mobileActivationExamValueAASIImage: mobileActivationExamValueAASIImage ??
          this.mobileActivationExamValueAASIImage,

      checkedLastDateValueAAUI:
          checkedLastDateValueAAUI ?? this.checkedLastDateValueAAUI,
      dateLastDateValueAAUIString:
          dateLastDateValueAAUIString ?? this.dateLastDateValueAAUIString,
      dateLastDateValueAAUI:
          dateLastDateValueAAUI ?? this.dateLastDateValueAAUI,
      terminationValueAAUIImage:
          terminationValueAAUIImage ?? this.terminationValueAAUIImage,
      notTwistingValueAAUIImage:
          notTwistingValueAAUIImage ?? this.notTwistingValueAAUIImage,
      mobileActivationExamValueAAUIImage: mobileActivationExamValueAAUIImage ??
          this.mobileActivationExamValueAAUIImage,

      spouseIsAgent: spouseIsAgent ?? this.spouseIsAgent,
      firstNamePartner: firstNamePartner ?? this.firstNamePartner,
      relation: relation ?? this.relation,
      relationId: relationId ?? this.relationId,
      directUnitName: directUnitName ?? this.directUnitName,
      spousePosition: spousePosition ?? this.spousePosition,
      spousePositionId: spousePositionId ?? this.spousePositionId,
      agentCode: agentCode ?? this.agentCode,

      ///Spouse and family
      listFamilyIsAgent: listFamilyIsAgent ?? this.listFamilyIsAgent,
      listFamilyIsAgentOthers: listFamilyIsAgentOthers ?? this.listFamilyIsAgentOthers,
      listFamilyIsEmploye: listFamilyIsEmploye ?? this.listFamilyIsEmploye,
      listFamilyIsAgentDelete: listFamilyIsAgentDelete ?? this.listFamilyIsAgentDelete,
      familyPersonName: familyPersonName ?? this.familyPersonName,
      putDataType: putDataType ?? this.putDataType,
      familyPersonRelationId:
          familyPersonRelationId ?? this.familyPersonRelationId,
      familyPersonRelation: familyPersonRelation ?? this.familyPersonRelation,
      familyDirectName: familyDirectName ?? this.familyDirectName,
      familyPositionId: familyPositionId ?? this.familyPositionId,
      familyPosition: familyPosition ?? this.familyPosition,
      familyAgentCode: familyAgentCode ?? this.familyAgentCode,
      familyDepartment: familyDepartment ?? this.familyDepartment,
      familyCompany: familyCompany ?? this.familyCompany,

      ///Education
      isJustAddEducation: isJustAddEducation ?? this.isJustAddEducation,
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

      ///Work Expperience
      isJustAddExperience: isJustAddExperience ?? this.isJustAddExperience,
      checkIsEmployee: checkIsEmployee ?? this.checkIsEmployee,
      statusEmployee: statusEmployee ?? this.statusEmployee,
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

      ///
      kkNo: kkNo ?? this.kkNo,
      kkImage: kkImage ?? this.kkImage,
      middleNamePartner: middleNamePartner ?? this.middleNamePartner,
      lastNamePartner: lastNamePartner ?? this.lastNamePartner,
      dobPartner: dobPartner ?? this.dobPartner,
      identityNoPartner: identityNoPartner ?? this.identityNoPartner,

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

enum PutDataType {
  isAgentInAllianz,
  isAgentInOthers,
  isEmployeeInAllianz,
  isInit
}
