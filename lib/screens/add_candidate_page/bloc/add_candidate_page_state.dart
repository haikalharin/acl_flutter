part of 'add_candidate_page_bloc.dart';

class AddCandidatePageState extends Equatable with FormzMixin {
  final FormzSubmissionStatus submitStatus;
  final MandatoryFieldValidator firstName;
  final MandatoryFieldValidator middleName;
  final MandatoryFieldValidator lastName;
  final MandatoryFieldValidator dob;
  final IdentityNoValidator identityNo;
  final MandatoryFieldValidator identityImage;
  final MandatoryFieldValidator identitySelfieImage;
  final IdentityNoValidator kkNo;
  final MandatoryFieldValidator kkImage;
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
  final CheckingstatusMasterReference? occupation;
  final DropdownFieldValidator occupationId;
  final AajiNoValidator noLicenceAAJI;
  final AajicityMasterReference? prevCompanyAAJI;
  final DropdownFieldValidator prevCompanyAAJIId;
  final MandatoryFieldValidator imageLicenceAAJI;
  final AasiNoValidator noLicenceAASI;
  final AajicityMasterReference? prevCompanyAASI;
  final DropdownFieldValidator prevCompanyAASIId;
  final MandatoryFieldValidator imageLicenceAASI;
  final AauiNoValidator noLicenceAAUI;
  final AajicityMasterReference? prevCompanyAAUI;
  final DropdownFieldValidator prevCompanyAAUIId;
  final MandatoryFieldValidator imageLicenceAAUI;
  final MandatoryFieldValidator firstNamePartner;
  final MandatoryFieldValidator middleNamePartner;
  final MandatoryFieldValidator lastNamePartner;
  final MandatoryFieldValidator dobPartner;
  final IdentityNoValidator identityNoPartner;
  final AajicityMasterReference? gender;
  final DropdownFieldValidator genderId;
  final AajicityMasterReference? relation;
  final DropdownFieldValidator relationId;
  final String? moveTo;
  final MasterDataModel? masterDataModel;
  final CandidateModel? candidateModel;
  final CandidateRegisterModel? candidateRegisterModel;
  final bool checkedPrevCompanyValueAAJI;
  final bool checkedPrevCompanyValueAASI;
  final bool checkedPrevCompanyValueAAUI;
  final bool checkedValueAAUI;
  final bool checkedValueMarriage;
  final String? message;
  final String? loadingMessage;

  const AddCandidatePageState({
    this.message = '',
    this.loadingMessage = '',
    this.firstName = const MandatoryFieldValidator.pure(),
    this.middleName = const MandatoryFieldValidator.pure(),
    this.lastName = const MandatoryFieldValidator.pure(),
    this.dob = const MandatoryFieldValidator.pure(),
    this.identityNo = const IdentityNoValidator.pure(),
    this.identityImage = const MandatoryFieldValidator.pure(),
    this.identitySelfieImage = const MandatoryFieldValidator.pure(),
    this.kkNo = const IdentityNoValidator.pure(),
    this.kkImage = const MandatoryFieldValidator.pure(),
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
    this.occupation,
    this.occupationId = const DropdownFieldValidator.pure(),
    this.noLicenceAAJI = const AajiNoValidator.pure(),
    this.prevCompanyAAJI,
    this.prevCompanyAAJIId = const DropdownFieldValidator.pure(),
    this.imageLicenceAAJI = const MandatoryFieldValidator.pure(),
    this.noLicenceAASI = const AasiNoValidator.pure(),
    this.prevCompanyAASI,
    this.prevCompanyAASIId = const DropdownFieldValidator.pure(),
    this.imageLicenceAASI = const MandatoryFieldValidator.pure(),
    this.noLicenceAAUI = const AauiNoValidator.pure(),
    this.prevCompanyAAUI,
    this.prevCompanyAAUIId = const DropdownFieldValidator.pure(),
    this.imageLicenceAAUI = const MandatoryFieldValidator.pure(),
    this.firstNamePartner = const MandatoryFieldValidator.pure(),
    this.middleNamePartner = const MandatoryFieldValidator.pure(),
    this.lastNamePartner = const MandatoryFieldValidator.pure(),
    this.dobPartner = const MandatoryFieldValidator.pure(),
    this.identityNoPartner = const IdentityNoValidator.pure(),
    this.gender,
    this.genderId = const DropdownFieldValidator.pure(),
    this.relation,
    this.relationId = const DropdownFieldValidator.pure(),
    this.masterDataModel,
    this.candidateModel,
    this.candidateRegisterModel,
    this.moveTo,
    this.checkedPrevCompanyValueAAJI = false,
    this.checkedPrevCompanyValueAASI = false,
    this.checkedPrevCompanyValueAAUI = false,
    this.checkedValueAAUI = false,
    this.checkedValueMarriage = true,
    this.submitStatus = FormzSubmissionStatus.initial,
  });

  @override
  List<Object?> get props => [
        firstName,
        submitStatus,
        firstName,
        middleName,
        lastName,
        dob,
        identityNo,
        identityImage,
        identitySelfieImage,
        kkNo,
        kkImage,
        address,
        rtRw,
        kecKel,
        postalCode,
        country,
        countryId,
        province,
        provinceId,
        city,
        cityId,
        occupation,
        occupationId,
        noLicenceAAJI,
        prevCompanyAAJI,
        prevCompanyAAJIId,
        imageLicenceAAJI,
        noLicenceAASI,
        prevCompanyAASI,
        prevCompanyAASIId,
        imageLicenceAASI,
        noLicenceAAUI,
        prevCompanyAAUI,
        prevCompanyAAUIId,
        imageLicenceAAUI,
        firstNamePartner,
        middleNamePartner,
        lastNamePartner,
        dobPartner,
        identityNoPartner,
        gender,
        genderId,
        relation,
        relationId,
        moveTo,
        masterDataModel,
        candidateModel,
        candidateRegisterModel,
        checkedPrevCompanyValueAAJI,
        checkedPrevCompanyValueAASI,
        checkedPrevCompanyValueAAUI,
        checkedValueAAUI,
        checkedValueMarriage,
        message,
        loadingMessage,
      ];

  @override
  List<FormzInput> get inputs {
    List<FormzInput> data = [
      firstName,
      identityNo,
      countryId,
      provinceId,
      cityId,
      occupationId,
      identityImage,
      kkImage,
      identitySelfieImage
    ];
    if (checkedPrevCompanyValueAAJI) {
      if (data.contains(noLicenceAAJI)) {
        data.remove(noLicenceAAJI);
      }
      if (data.contains(imageLicenceAAJI)) {
        data.remove(imageLicenceAAJI);
      }
      data.add(prevCompanyAAJIId);
      data.add(noLicenceAAJI);
      data.add(imageLicenceAAJI);
    } else if (checkedPrevCompanyValueAAJI == false &&
        (noLicenceAAJI.isValid || imageLicenceAAJI.isValid)) {
      data.remove(prevCompanyAAJIId);
      if (data.contains(noLicenceAAJI)) {
        data.remove(noLicenceAAJI);
      }
      if (data.contains(imageLicenceAAJI)) {
        data.remove(imageLicenceAAJI);
      }
      data.add(noLicenceAAJI);
      data.add(imageLicenceAAJI);
    } else {
      data.remove(noLicenceAAJI);
      data.remove(prevCompanyAAJIId);
      data.remove(imageLicenceAAJI);
    }

    if (checkedPrevCompanyValueAASI) {
      if (data.contains(noLicenceAASI)) {
        data.remove(noLicenceAASI);
      }
      if (data.contains(imageLicenceAASI)) {
        data.remove(imageLicenceAASI);
      }
      data.add(prevCompanyAASIId);
      data.add(noLicenceAASI);
      data.add(imageLicenceAASI);
    } else if (checkedPrevCompanyValueAASI == false &&
        (noLicenceAASI.isValid || imageLicenceAASI.isValid)) {
      data.remove(prevCompanyAASIId);
      if (data.contains(noLicenceAASI)) {
        data.remove(noLicenceAASI);
      }
      if (data.contains(imageLicenceAASI)) {
        data.remove(imageLicenceAASI);
      }
      data.add(noLicenceAASI);
      data.add(imageLicenceAASI);
    } else {
      data.remove(noLicenceAASI);
      data.remove(prevCompanyAASIId);
      data.remove(imageLicenceAASI);
    }

    if (checkedValueAAUI) {
      if (checkedPrevCompanyValueAAUI) {
        if (data.contains(noLicenceAAUI)) {
          data.remove(noLicenceAAUI);
        }
        if (data.contains(imageLicenceAAUI)) {
          data.remove(imageLicenceAAUI);
        }
        data.add(prevCompanyAAUIId);
        data.add(noLicenceAAUI);
        data.add(imageLicenceAAUI);
      } else if (checkedPrevCompanyValueAAUI == false &&
          (noLicenceAAUI.isValid || imageLicenceAAUI.isValid)) {
        data.remove(prevCompanyAAUIId);
        if (data.contains(noLicenceAAUI)) {
          data.remove(noLicenceAAUI);
        }
        if (data.contains(imageLicenceAAUI)) {
          data.remove(imageLicenceAAUI);
        }
        data.add(noLicenceAAUI);
        data.add(imageLicenceAAUI);
      } else {
        data.remove(noLicenceAAUI);
        data.remove(prevCompanyAAUIId);
        data.remove(imageLicenceAAUI);
      }
    } else {
      data.remove(noLicenceAAUI);
      data.remove(prevCompanyAAUIId);
      data.remove(imageLicenceAAUI);
    }
    if (checkedValueMarriage) {
      data.add(firstNamePartner);
      data.add(identityNoPartner);
      data.add(dobPartner);
      data.add(genderId);
      data.add(relationId);
    } else {
      data.remove(firstNamePartner);
      data.remove(identityNoPartner);
      data.remove(dobPartner);
      data.remove(genderId);
      data.remove(relationId);
    }
    return data;
  }

  AddCandidatePageState copyWith({
    String? message,
    String? loadingMessage,
    MandatoryFieldValidator? firstName,
    MandatoryFieldValidator? middleName,
    MandatoryFieldValidator? lastName,
    MandatoryFieldValidator? dob,
    IdentityNoValidator? identityNo,
    MandatoryFieldValidator? identityImage,
    MandatoryFieldValidator? identitySelfieImage,
    IdentityNoValidator? kkNo,
    MandatoryFieldValidator? kkImage,
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
    CheckingstatusMasterReference? occupation,
    DropdownFieldValidator? occupationId,
    AajiNoValidator? noLicenceAAJI,
    AajicityMasterReference? prevCompanyAAJI,
    DropdownFieldValidator? prevCompanyAAJIId,
    MandatoryFieldValidator? imageLicenceAAJI,
    AasiNoValidator? noLicenceAASI,
    AajicityMasterReference? prevCompanyAASI,
    DropdownFieldValidator? prevCompanyAASIId,
    MandatoryFieldValidator? imageLicenceAASI,
    AauiNoValidator? noLicenceAAUI,
    AajicityMasterReference? prevCompanyAAUI,
    DropdownFieldValidator? prevCompanyAAUIId,
    MandatoryFieldValidator? imageLicenceAAUI,
    MandatoryFieldValidator? firstNamePartner,
    MandatoryFieldValidator? middleNamePartner,
    MandatoryFieldValidator? lastNamePartner,
    MandatoryFieldValidator? dobPartner,
    IdentityNoValidator? identityNoPartner,
    AajicityMasterReference? gender,
    DropdownFieldValidator? genderId,
    AajicityMasterReference? relation,
    DropdownFieldValidator? relationId,
    MasterDataModel? masterDataModel,
    String? moveTo,
    bool? checkedPrevCompanyValueAAJI,
    bool? checkedPrevCompanyValueAASI,
    bool? checkedPrevCompanyValueAAUI,
    bool? checkedValueAAUI,
    bool? checkedValueMarriage,
    CandidateModel? candidateModel,
    CandidateRegisterModel? candidateRegisterModel,
    FormzSubmissionStatus? submitStatus,
  }) {
    return AddCandidatePageState(
      message: message,
      loadingMessage: loadingMessage?? this.loadingMessage,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      identityNo: identityNo ?? this.identityNo,
      identityImage: identityImage ?? this.identityImage,
      identitySelfieImage: identitySelfieImage ?? this.identitySelfieImage,
      kkNo: kkNo ?? this.kkNo,
      kkImage: kkImage ?? this.kkImage,
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
      occupation: occupation ?? this.occupation,
      occupationId: occupationId ?? this.occupationId,
      noLicenceAAJI: noLicenceAAJI ?? this.noLicenceAAJI,
      prevCompanyAAJI: prevCompanyAAJI ?? this.prevCompanyAAJI,
      prevCompanyAAJIId: prevCompanyAAJIId ?? this.prevCompanyAAJIId,
      imageLicenceAAJI: imageLicenceAAJI ?? this.imageLicenceAAJI,
      noLicenceAASI: noLicenceAASI ?? this.noLicenceAASI,
      prevCompanyAASI: prevCompanyAASI ?? this.prevCompanyAASI,
      prevCompanyAASIId: prevCompanyAASIId ?? this.prevCompanyAASIId,
      imageLicenceAASI: imageLicenceAASI ?? this.imageLicenceAASI,
      noLicenceAAUI: noLicenceAAUI ?? this.noLicenceAAUI,
      prevCompanyAAUI: prevCompanyAAUI ?? this.prevCompanyAAUI,
      prevCompanyAAUIId: prevCompanyAAUIId ?? this.prevCompanyAAUIId,
      imageLicenceAAUI: imageLicenceAAUI ?? this.imageLicenceAAUI,
      firstNamePartner: firstNamePartner ?? this.firstNamePartner,
      middleNamePartner: middleNamePartner ?? this.middleNamePartner,
      lastNamePartner: lastNamePartner ?? this.lastNamePartner,
      dobPartner: dobPartner ?? this.dobPartner,
      identityNoPartner: identityNoPartner ?? this.identityNoPartner,
      gender: gender ?? this.gender,
      genderId: genderId ?? this.genderId,
      relation: relation ?? this.relation,
      relationId: relationId ?? this.relationId,
      masterDataModel: masterDataModel ?? this.masterDataModel,
      candidateModel: candidateModel ?? this.candidateModel,
      candidateRegisterModel:
          candidateRegisterModel ?? this.candidateRegisterModel,
      moveTo: moveTo ?? this.moveTo,
      checkedPrevCompanyValueAAJI:
          checkedPrevCompanyValueAAJI ?? this.checkedPrevCompanyValueAAJI,
      checkedPrevCompanyValueAASI:
          checkedPrevCompanyValueAASI ?? this.checkedPrevCompanyValueAASI,
      checkedPrevCompanyValueAAUI:
          checkedPrevCompanyValueAAUI ?? this.checkedPrevCompanyValueAAUI,
      checkedValueAAUI: checkedValueAAUI ?? this.checkedValueAAUI,
      checkedValueMarriage: checkedValueMarriage ?? this.checkedValueMarriage,
      submitStatus: submitStatus ?? this.submitStatus,
    );
  }
}

class AddAgentPageInitial extends AddCandidatePageState {}
