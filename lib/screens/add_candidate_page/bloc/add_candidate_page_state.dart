part of 'add_candidate_page_bloc.dart';

class AddCandidatePageState extends Equatable with FormzMixin {
  final FormzSubmissionStatus submitStatus;
  final MandatoryFieldValidator firstName;
  final MandatoryFieldValidator middleName;
  final MandatoryFieldValidator lastName;
  final MandatoryFieldValidator dob;
  final MandatoryFieldValidator identityNo;
  final MandatoryFieldValidator identityImage;
  final MandatoryFieldValidator identitySelfieImage;
  final MandatoryFieldValidator kkNo;
  final MandatoryFieldValidator kkImage;
  final MandatoryFieldValidator address;
  final MandatoryFieldValidator rtRw;
  final MandatoryFieldValidator kecKel;
  final MandatoryFieldValidator postalCode;
  final AajicityMasterReference? country;
  final DropdownFieldValidator countryId;
  final AajicityMasterReference? province;
  final DropdownFieldValidator provinceId;
  final CityMasterReference? city;
  final DropdownFieldValidator cityId;
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
  final MandatoryFieldValidator identityNoPartner;
  final AajicityMasterReference? gender;
  final DropdownFieldValidator genderId;
  final AajicityMasterReference? relation;
  final DropdownFieldValidator relationId;
  final String? moveTo;
  final MasterDataModel? masterDataModel;
  final CandidateModel? candidateModel;
  final bool checkedValueAAJI;
  final bool checkedValueAASI;
  final bool checkedNeedValueAAUI;
  final bool checkedValueAAUI;
  final bool checkedValueMarriage;
  final String? message;

  const AddCandidatePageState({
    this.message,
    this.firstName = const MandatoryFieldValidator.pure(),
    this.middleName = const MandatoryFieldValidator.pure(),
    this.lastName = const MandatoryFieldValidator.pure(),
    this.dob = const MandatoryFieldValidator.pure(),
    this.identityNo = const MandatoryFieldValidator.pure(),
    this.identityImage = const MandatoryFieldValidator.pure(),
    this.identitySelfieImage = const MandatoryFieldValidator.pure(),
    this.kkNo = const MandatoryFieldValidator.pure(),
    this.kkImage = const MandatoryFieldValidator.pure(),
    this.address = const MandatoryFieldValidator.pure(),
    this.rtRw = const MandatoryFieldValidator.pure(),
    this.kecKel = const MandatoryFieldValidator.pure(),
    this.postalCode = const MandatoryFieldValidator.pure(),
    this.country,
    this.countryId = const DropdownFieldValidator.pure(),
    this.province,
    this.provinceId = const DropdownFieldValidator.pure(),
    this.city,
    this.cityId = const DropdownFieldValidator.pure(),
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
    this.identityNoPartner = const MandatoryFieldValidator.pure(),
    this.gender,
    this.genderId = const DropdownFieldValidator.pure(),
    this.relation,
    this.relationId = const DropdownFieldValidator.pure(),
    this.masterDataModel,
    this.candidateModel,
    this.moveTo,
    this.checkedValueAAJI = false,
    this.checkedValueAASI = false,
    this.checkedNeedValueAAUI = false,
    this.checkedValueAAUI = false,
    this.checkedValueMarriage = false,
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
        imageLicenceAAJI,
        noLicenceAASI,
        imageLicenceAASI,
        noLicenceAAUI,
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
        checkedValueAAJI,
        checkedValueAASI,
        checkedNeedValueAAUI,
        checkedValueAAUI,
        checkedValueMarriage,
        message,
      ];

  @override
  List<FormzInput> get inputs {
    List<FormzInput> data = [firstName];
    if (checkedValueAAJI) {
      data.add(noLicenceAAJI);
      data.add(imageLicenceAAJI);
    }

    if (checkedValueAASI) {
      data.add(noLicenceAASI);
      data.add(imageLicenceAASI);
    }
    if (checkedValueAAUI) {
      data.add(noLicenceAAUI);
      data.add(imageLicenceAAUI);
    }

    // if (checkedValueMarriage) {
    //   data.add(firstNamePartner);
    //   data.add(middleNamePartner);
    //   data.add(lastNamePartner);
    //   data.add(identityNoPartner);
    //   data.add(dobPartner);
    // }
    return data;
  }

  AddCandidatePageState copyWith({
    String? message,
    MandatoryFieldValidator? firstName,
    MandatoryFieldValidator? middleName,
    MandatoryFieldValidator? lastName,
    MandatoryFieldValidator? dob,
    MandatoryFieldValidator? identityNo,
    MandatoryFieldValidator? identityImage,
    MandatoryFieldValidator? identitySelfieImage,
    MandatoryFieldValidator? kkNo,
    MandatoryFieldValidator? kkImage,
    MandatoryFieldValidator? address,
    MandatoryFieldValidator? rtRw,
    MandatoryFieldValidator? kecKel,
    MandatoryFieldValidator? postalCode,
    AajicityMasterReference? country,
    DropdownFieldValidator? countryId,
    AajicityMasterReference? province,
    DropdownFieldValidator? provinceId,
    CityMasterReference? city,
    DropdownFieldValidator? cityId,
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
    MandatoryFieldValidator? identityNoPartner,
    AajicityMasterReference? gender,
    DropdownFieldValidator? genderId,
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
    FormzSubmissionStatus? submitStatus,
  }) {
    return AddCandidatePageState(
      message: message ?? this.message,
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
      gender: gender ?? this.gender,
      genderId: genderId ?? this.genderId,
      relation: relation ?? this.relation,
      relationId: relationId ?? this.relationId,
      masterDataModel: masterDataModel ?? this.masterDataModel,
      candidateModel: candidateModel ?? this.candidateModel,
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

class AddAgentPageInitial extends AddCandidatePageState {}
