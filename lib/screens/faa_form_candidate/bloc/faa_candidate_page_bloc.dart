import 'dart:async';

import 'package:acl_flutter/data/model/candidate/request_candidate_doc_model.dart';
import 'package:acl_flutter/data/model/master_data_model/master_data_model.dart';
import 'package:acl_flutter/data/model/sepouse/request_sepouse_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';

import '../../../common/validators/identity_no_validator.dart';
import '../../../common/validators/mandatory_dropdown_validator.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import 'package:equatable/equatable.dart';

import '../../../common/validators/zipcode_validator.dart';
import '../../../core/local_storage/secure_storage/secure_storage.dart';
import '../../../core/router/routes.dart';
import '../../../data/model/candidate/candidate_data_model.dart';
import '../../../data/model/candidate/candidate_model.dart';
import '../../../data/model/candidate/candidate_register_model.dart';
import '../../../data/model/candidate/request_candidate_model.dart';
import '../../../data/model/candidate/request_pending_simple_checking_model.dart';
import '../../../data/model/login_model/login_model.dart';
import '../../../data/repository/candidate/candidate_repository.dart';

part 'faa_candidate_page_event.dart';

part 'faa_candidate_page_state.dart';

class FaaCandidatePageBloc
    extends Bloc<FaaCandidatePageEvent, FaaCandidatePageState> {
  final CandidateRepository candidateRepository;

  FaaCandidatePageBloc({required this.candidateRepository})
      : super(AddAgentPageInitial()) {
    on<TabTypeInputEvent>(tabTypeExperienceInput);
    on<CheckEmployeeInputEvent>(checkEmployeeInput);
    on<UnitNameExperienceInputEvent>(unitNameExperienceInput);
    on<LastDepartmentExperienceInputEvent>(lastDepartmentExperienceInput);
    on<DirectLeaderExperienceInputEvent>(directLeaderExperienceInput);
    on<RecentStatusEmployeeExperienceInputEvent>(
        recentStatusEmployeeExperienceInput);
    on<CompanyNameExperienceInputEvent>(companyNameExperienceInput);
    on<CompanyTypeExperienceInputEvent>(companyTypeExperienceInput);
    on<DepartmentExperienceInputEvent>(departmentExperienceInput);
    on<CheckStillWorkingInputEvent>(checkStillWorkingInput);
    on<StartWorkingExperienceInputEvent>(startWorkingExperienceInput);
    on<EndWorkingExperienceInputEvent>(endWorkingExperienceInput);
    on<AddWorkingExperienceEvent>(addWorkingExperience);
    on<FetchMasterDataEvent>(fetchMasterData);
    on<FirstNameInputEvent>(firstNameInput);
    on<MiddleNameInputEvent>(middleNameInput);
    on<LastNameInputEvent>(lastNameInput);
    on<DobInputEvent>(dobInput);
    on<IdentityNoInputEvent>(identityNoInput);
    on<IdentityImageInputEvent>(identityImageInput);
    on<IdentitySelfieImageInputEvent>(identitySelfieImageInput);
    on<KkNoInputEvent>(kkNoInput);
    on<KkImageInputEvent>(kkImageInput);
    on<AddressInputEvent>(addressInput);
    on<RtRwInputEvent>(rtRwInput);
    on<KecKelInputEvent>(kecKelInput);
    on<PostalCodeInputEvent>(postalCodeInput);
    on<CountryInputEvent>(countryInput);
    on<ProvinceInputEvent>(provinceInput);
    on<CityInputEvent>(cityInput);
    on<OccupationInputEvent>(occupationInput);
    on<AajiCheckedInputEvent>(aajiCheckedInput);
    on<AajiNoInputEvent>(noLicenceAAJIInput);
    on<AajiImageInputEvent>(imageLicenceAAJIInput);
    on<AasiCheckedInputEvent>(aasiCheckedInput);
    on<AasiNoInputEvent>(noLicenceAASIInput);
    on<AasiImageInputEvent>(imageLicenceAASIInput);
    on<AauiCheckedInputEvent>(aauiCheckedInput);
    on<AauiNoInputEvent>(noLicenceAAUIInput);
    on<AauiImageInputEvent>(imageLicenceAAUIInput);
    on<MarriedCheckedInputEvent>(marriedCheckedInputEvent);
    on<FirstNamePartnerInputEvent>(firstNamePartnerInput);
    on<MiddleNamePartnerInputEvent>(middleNamePartnerInput);
    on<LastNamePartnerInputEvent>(lastNamePartnerInput);
    on<DobPartnerInputEvent>(dobPartnerInput);
    on<PartnerIdentityNoInputEvent>(partnerIdentityNoInput);
    on<GenderPartnerInputEvent>(genderPartnerInput);
    on<RelationPartnerInputEvent>(relationPartnerInput);
    on<AddAgentSubmittedEvent>(addAgentSubmitted);
    on<AddAgentDocSubmittedEvent>(addAgentDocSubmitted);
    on<FaaCandidatePageInitialEvent>(addAgentPageInitial);
    on<FetchCandidateDataEvent>(fetchCandidateData);
  }

  Future<void> addAgentPageInitial(FaaCandidatePageInitialEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(AddAgentPageInitial());
  }

  Future<void> fetchMasterData(
      FetchMasterDataEvent event, Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    try {
      final result = await candidateRepository.fetchMasterData();
      result.when(success: (response) {
        emit(state.copyWith(
            masterDataModel: response.data,
            message: 'success-get-master-data',
            submitStatus: FormzSubmissionStatus.success));
      }, failure: (error) {
        emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<void> fetchCandidateData(FetchCandidateDataEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    try {
      final result =
          await candidateRepository.getCandidateData(event.candidateId);
      result.when(success: (response) {
        emit(state.copyWith(
            candidateDataModel: response.data,
            message: 'success-get-candidate-data',
            submitStatus: FormzSubmissionStatus.success));
      }, failure: (error) {
        emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<void> tabTypeExperienceInput(
      TabTypeInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final value = event.tabType;
    emit(state.copyWith(
      tabType: value,
    ));
  }

  Future<void> checkStillWorkingInput(CheckStillWorkingInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = event.isCheck;
    emit(state.copyWith(
      checkedStillWorking: value,
    ));
  }

  Future<void> checkEmployeeInput(CheckEmployeeInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      checkIsEmployee: value,
    ));
  }

  Future<void> unitNameExperienceInput(UnitNameExperienceInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.unitName);
    emit(state.copyWith(
      unitName: value,
    ));
  }

  Future<void> lastDepartmentExperienceInput(
      LastDepartmentExperienceInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.lastDepartment);
    emit(state.copyWith(
      lastDepartment: value,
    ));
  }

  Future<void> directLeaderExperienceInput(
      DirectLeaderExperienceInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.leader);
    emit(state.copyWith(
      directLeader: value,
    ));
  }

  Future<void> recentStatusEmployeeExperienceInput(
      RecentStatusEmployeeExperienceInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.status);
    emit(state.copyWith(
      recentStatus: value,
    ));
  }

  Future<void> companyNameExperienceInput(CompanyNameExperienceInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.companyName);
    emit(state.copyWith(
      companyName: value,
    ));
  }

  Future<void> companyTypeExperienceInput(CompanyTypeExperienceInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.companyType);
    emit(state.copyWith(
      companyType: value,
    ));
  }

  Future<void> departmentExperienceInput(DepartmentExperienceInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.department);
    emit(state.copyWith(
      department: value,
    ));
  }

  Future<void> startWorkingExperienceInput(
      StartWorkingExperienceInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    var month = event.startWorking.month.toString().length == 1
        ? '0${event.startWorking.month}'
        : event.startWorking.month;
    var day = event.startWorking.day.toString().length == 1
        ? '0${event.startWorking.day}'
        : event.startWorking.day;
    var dateTime = "${event.startWorking.year}-$month-$day";
    final value = MandatoryFieldValidator.dirty(dateTime);
    emit(state.copyWith(
      startWorking: value,
      startWorkingDate: event.startWorking,
    ));
  }

  Future<void> endWorkingExperienceInput(EndWorkingExperienceInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    var month = event.endWorking.month.toString().length == 1
        ? '0${event.endWorking.month}'
        : event.endWorking.month;
    var day = event.endWorking.day.toString().length == 1
        ? '0${event.endWorking.day}'
        : event.endWorking.day;
    var dateTime = "${event.endWorking.year}-$month-$day";
    final value = MandatoryFieldValidator.dirty(dateTime);
    emit(state.copyWith(
      endWorking: value,
      endWorkingDate: event.endWorking,
    ));
  }

  Future<void> addWorkingExperience(AddWorkingExperienceEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      isJustAddExperience: true,
      submitStatus: FormzSubmissionStatus.inProgress,
    ));
    if (event.isDelete) {
      emit(state.copyWith(
        addCompanyModel: AddCompanyModel(),
        companyName: MandatoryFieldValidator.pure(),
        unitName: MandatoryFieldValidator.pure(),
        department: MandatoryFieldValidator.pure(),
        startWorking: MandatoryFieldValidator.pure(),
        endWorking: MandatoryFieldValidator.pure(),
        submitStatus: FormzSubmissionStatus.success,
      ));
    } else {
      if (state.isValid) {
        try {
          final value = AddCompanyModel(
            companyName: state.companyName.value,
            companyType: state.companyType.value,
            department: state.department.value,
            checkedStillWorking: state.checkedStillWorking,
            startWorking: state.startWorking.value,
            startWorkingDate: state.startWorkingDate,
            endWorking: state.endWorking.value,
            endWorkingDate: state.endWorkingDate,
          );
          emit(state.copyWith(
            addCompanyModel: value,
            isJustAddExperience: false,
            message: 'success-add-experience',
            submitStatus: FormzSubmissionStatus.success,
          ));
        } catch (e) {
          emit(state.copyWith(
            submitStatus: FormzSubmissionStatus.failure,
          ));
        }
      } else {
        emit(state.copyWith(
          submitStatus: FormzSubmissionStatus.failure,
        ));
      }
    }
  }

  Future<void> firstNameInput(
      FirstNameInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final firstName = MandatoryFieldValidator.dirty(event.firstName);
    emit(state.copyWith(
      firstName: firstName,
    ));
  }

  Future<void> middleNameInput(
      MiddleNameInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final middleName = MandatoryFieldValidator.dirty(event.middleName);
    emit(state.copyWith(
      middleName: middleName,
    ));
  }

  Future<void> lastNameInput(
      LastNameInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final lastName = MandatoryFieldValidator.dirty(event.lastName);
    emit(state.copyWith(
      lastName: lastName,
    ));
  }

  Future<void> dobInput(
      DobInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final dob = MandatoryFieldValidator.dirty(event.dob);
    emit(state.copyWith(
      dob: dob,
    ));
  }

  Future<void> identityNoInput(
      IdentityNoInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final identityNo = IdentityNoValidator.dirty(event.identityNo);
    emit(state.copyWith(
      identityNo: identityNo,
    ));
  }

  Future<void> identityImageInput(IdentityImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final identityImage = MandatoryFieldValidator.dirty(event.identityImage);
    emit(state.copyWith(
      identityImage: identityImage,
    ));
  }

  Future<void> identitySelfieImageInput(IdentitySelfieImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final identitySelfieImage =
        MandatoryFieldValidator.dirty(event.identitySelfieImage);
    emit(state.copyWith(
      identitySelfieImage: identitySelfieImage,
    ));
  }

  Future<void> kkNoInput(
      KkNoInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final kkNo = IdentityNoValidator.dirty(event.kkNo);
    emit(state.copyWith(
      kkNo: kkNo,
    ));
  }

  Future<void> kkImageInput(
      KkImageInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final kkImage = MandatoryFieldValidator.dirty(event.kkImage);
    emit(state.copyWith(
      kkImage: kkImage,
    ));
  }

  Future<void> addressInput(
      AddressInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final address = MandatoryFieldValidator.dirty(event.address);
    emit(state.copyWith(
      address: address,
    ));
  }

  Future<void> rtRwInput(
      RtRwInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final rtRw = MandatoryFieldValidator.dirty(event.rtRw);
    emit(state.copyWith(
      rtRw: rtRw,
    ));
  }

  Future<void> kecKelInput(
      KecKelInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final kecKel = MandatoryFieldValidator.dirty(event.kecKel);
    emit(state.copyWith(
      kecKel: kecKel,
    ));
  }

  Future<void> postalCodeInput(
      PostalCodeInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final postalCode = ZipcodeValidator.dirty(event.postalCode);
    emit(state.copyWith(
      postalCode: postalCode,
    ));
  }

  Future<void> countryInput(
      CountryInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    if (event.country.id == 0 || event.country.id == null) {
      const countryId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        countryId: countryId,
        country: null,
      ));
    } else {
      final countryId = DropdownFieldValidator.dirty(event.country.id ?? 0);
      emit(state.copyWith(
        countryId: countryId,
        country: event.country,
      ));
    }
  }

  Future<void> provinceInput(
      ProvinceInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    if (event.province.id == 0 || event.province.id == null) {
      const provinceId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        provinceId: provinceId,
        province: null,
      ));
    } else {
      final provinceId = DropdownFieldValidator.dirty(event.province.id ?? 0);
      emit(state.copyWith(
        provinceId: provinceId,
        province: event.province,
      ));
    }
  }

  Future<void> cityInput(
      CityInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    if (event.city.id == 0 || event.city.id == null) {
      const cityId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        cityId: cityId,
        city: null,
      ));
    } else {
      final cityId = DropdownFieldValidator.dirty(event.city.id ?? 0);
      emit(state.copyWith(
        cityId: cityId,
        city: event.city,
      ));
    }
  }

  Future<void> occupationInput(
      OccupationInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    if (event.occupation.id == 0 || event.occupation.id == null) {
      const occupationId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        occupationId: occupationId,
        occupation: null,
      ));
    } else {
      final occupationId =
          DropdownFieldValidator.dirty(event.occupation.id ?? 0);
      emit(state.copyWith(
        occupationId: occupationId,
        occupation: event.occupation,
      ));
    }
  }

  Future<void> noLicenceAAJIInput(
      AajiNoInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final noLicenceAAJI = MandatoryFieldValidator.dirty(event.aajiNo);
    emit(state.copyWith(
      noLicenceAAJI: noLicenceAAJI,
    ));
  }

  Future<void> imageLicenceAAJIInput(
      AajiImageInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final imageLicenceAAJI = MandatoryFieldValidator.dirty(event.aajiImage);
    emit(state.copyWith(
      imageLicenceAAJI: imageLicenceAAJI,
    ));
  }

  Future<void> noLicenceAASIInput(
      AasiNoInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final noLicenceAASI = MandatoryFieldValidator.dirty(event.aasiNo);
    emit(state.copyWith(
      noLicenceAASI: noLicenceAASI,
    ));
  }

  Future<void> imageLicenceAASIInput(
      AasiImageInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final imageLicenceAASI = MandatoryFieldValidator.dirty(event.aasiImage);
    emit(state.copyWith(
      imageLicenceAASI: imageLicenceAASI,
    ));
  }

  Future<void> noLicenceAAUIInput(
      AauiNoInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final noLicenceAAUI = MandatoryFieldValidator.dirty(event.aauiNo);
    emit(state.copyWith(
      noLicenceAAUI: noLicenceAAUI,
    ));
  }

  Future<void> imageLicenceAAUIInput(
      AauiImageInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final imageLicenceAAUI = MandatoryFieldValidator.dirty(event.aauiImage);
    emit(state.copyWith(
      imageLicenceAAUI: imageLicenceAAUI,
    ));
  }

  Future<void> firstNamePartnerInput(FirstNamePartnerInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final firstNamePartner =
        MandatoryFieldValidator.dirty(event.firstNamePartner);
    emit(state.copyWith(
      firstNamePartner: firstNamePartner,
    ));
  }

  Future<void> middleNamePartnerInput(MiddleNamePartnerInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final middleNamePartner =
        MandatoryFieldValidator.dirty(event.middleNamePartner);
    emit(state.copyWith(
      middleNamePartner: middleNamePartner,
    ));
  }

  Future<void> lastNamePartnerInput(LastNamePartnerInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final lastNamePartner =
        MandatoryFieldValidator.dirty(event.lastNamePartner);
    emit(state.copyWith(
      lastName: lastNamePartner,
    ));
  }

  Future<void> dobPartnerInput(
      DobPartnerInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final dobPartner = MandatoryFieldValidator.dirty(event.dobPartner);
    emit(state.copyWith(
      dobPartner: dobPartner,
    ));
  }

  Future<void> partnerIdentityNoInput(PartnerIdentityNoInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final identityNoPartner =
        IdentityNoValidator.dirty(event.partnerIdentityNo);
    emit(state.copyWith(
      identityNoPartner: identityNoPartner,
    ));
  }

  Future<void> genderPartnerInput(GenderPartnerInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    if (event.gender.id == 0 || event.gender.id == null) {
      const genderId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        genderId: genderId,
        gender: null,
      ));
    } else {
      final genderId = DropdownFieldValidator.dirty(event.gender.id ?? 0);
      emit(state.copyWith(
        genderId: genderId,
        gender: event.gender,
      ));
    }
  }

  Future<void> relationPartnerInput(RelationPartnerInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    if (event.relation.id == 0 || event.relation.id == null) {
      const relationId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        relationId: relationId,
        relation: null,
      ));
    } else {
      final relationId = DropdownFieldValidator.dirty(event.relation.id ?? 0);
      emit(state.copyWith(
        relationId: relationId,
        relation: event.relation,
      ));
    }
  }

  Future<void> aajiCheckedInput(
      AajiCheckedInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueAAJI: event.aajiChecked,
    ));
  }

  Future<void> aasiCheckedInput(
      AasiCheckedInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueAASI: event.aasiChecked,
    ));
  }

  Future<void> aauiCheckedInput(
      AauiCheckedInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueAAUI: event.aauiChecked,
    ));
  }

  Future<void> marriedCheckedInputEvent(MarriedCheckedInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueMarriage: event.marriedChecked,
    ));
  }

  Future<void> addAgentSubmitted(
      AddAgentSubmittedEvent event, Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    if (state.isValid) {
      try {
        LoginModel loginModel = await SecureStorage().getUser();
        final result = await candidateRepository
            .addRegisterCandidate(RequestCandidateModel(
          firstName: state.firstName.value.toUpperCase(),
          middleName: state.middleName.value.toUpperCase(),
          lastName: state.lastName.value.toUpperCase(),
          dob: state.dob.value,
          address1: state.address.value.toUpperCase(),
          address2: state.rtRw.value.toUpperCase(),
          address3: state.kecKel.value.toUpperCase(),
          city: state.cityId.value.toString(),
          province: state.provinceId.value.toString(),
          zipCode: state.postalCode.value,
          country: state.countryId.value.toString(),
          leaderName: (loginModel.name ?? '').toUpperCase(),
          leaderAgentCode: (loginModel.uid ?? ''),
          spouseIdCardNo: state.identityNoPartner.value,
          idCardNo: state.identityNo.value,
          occupation: state.occupationId.value.toString(),
          occupationOther: '',
          aajiNo: state.noLicenceAAJI.value,
          aajiActiveFlag: state.checkedValueAAJI.toString(),
          aasiNo: state.noLicenceAASI.value,
          aasiActiveFlag: state.checkedValueAASI.toString(),
          aauiNo: state.noLicenceAAUI.value,
          aauiActiveFlag: state.checkedValueAAJI.toString(),
        ));
        await result.when(success: (response) async {
          CandidateRegisterModel responseData = response.data;
          List<FamilyDetail> listFamiliDetail = [
            FamilyDetail(
                idCardNo: state.identityNoPartner.value,
                firstName: state.firstNamePartner.value.toUpperCase(),
                gender: state.gender?.longDescriptionEng ?? '',
                relation: state.relationId.value.toString(),
                dateOfBirth: state.dobPartner.value)
          ];

          final result = await candidateRepository
              .pendingSimpleChecking(RequestPendingSimpleCheckingModel(
            id: responseData.id.toString(),
            firstName: state.firstName.value.toUpperCase(),
            middleName: state.middleName.value.toUpperCase(),
            lastName: state.lastName.value.toUpperCase(),
            dob: state.dob.value,
            address1: state.address.value.toUpperCase(),
            address2: state.rtRw.value.toUpperCase(),
            address3: state.kecKel.value.toUpperCase(),
            city: state.cityId.value.toString(),
            province: state.provinceId.value.toString(),
            zipCode: state.postalCode.value,
            country: state.countryId.value.toString(),
            leaderName: (loginModel.name ?? '').toUpperCase(),
            leaderAgentCode: (loginModel.uid ?? ''),
            spouseIdCardNo: state.identityNoPartner.value,
            idCardNo: state.identityNo.value,
            occupation: state.occupationId.value.toString(),
            occupationOther: '',
            aajiNo: state.noLicenceAAJI.value,
            aajiActiveFlag: state.checkedValueAAJI.toString(),
            aasiNo: state.noLicenceAASI.value,
            aasiActiveFlag: state.checkedValueAASI.toString(),
            aauiNo: state.noLicenceAAUI.value,
            aauiActiveFlag: state.checkedValueAAJI.toString(),
          ));

          await result.when(success: (response) async {
            if (state.checkedValueMarriage) {
              final result = await candidateRepository.addRegisterSepouse(
                  RequestSepouseModel(
                      candidateId: responseData.id.toString(),
                      familyCardNo: state.kkNo.value,
                      familyDetails: listFamiliDetail));
              await result.when(success: (response) async {
                final result = await candidateRepository
                    .addFolderDoc(responseData.id.toString());
                await result.when(success: (response) async {
                  emit(state.copyWith(
                      moveTo: Routes.userList,
                      candidateRegisterModel: responseData,
                      message: 'create-register',
                      submitStatus: FormzSubmissionStatus.success));
                }, failure: (error) async {
                  emit(state.copyWith(
                      submitStatus: FormzSubmissionStatus.failure));
                });
              }, failure: (error) async {
                emit(state.copyWith(
                    submitStatus: FormzSubmissionStatus.failure));
              });
            } else {
              final result = await candidateRepository
                  .addFolderDoc(responseData.id.toString());
              await result.when(success: (response) async {
                emit(state.copyWith(
                    moveTo: Routes.userList,
                    candidateRegisterModel: responseData,
                    message: 'create-register',
                    submitStatus: FormzSubmissionStatus.success));
              }, failure: (error) async {
                emit(state.copyWith(
                    submitStatus: FormzSubmissionStatus.failure));
              });
            }
          }, failure: (error) async {
            emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
          });
        }, failure: (error) async {
          emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
        });
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    }
  }

  Future<void> addAgentDocSubmitted(AddAgentDocSubmittedEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    if (state.isValid) {
      try {
        await _sendDoc().then((value) {
          if (value == 0) {
            emit(state.copyWith(
                moveTo: Routes.userList,
                message: 'send-doc',
                submitStatus: FormzSubmissionStatus.success));
          } else {
            emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
          }
        });
      } catch (error) {
        emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
        if (kDebugMode) {
          print(error);
        }
      }
    }
  }

  Future<int?> _sendDoc() async {
    try {
      LoginModel loginModel = await SecureStorage().getUser();

      List<RequestCandidateDocModel> listDoc = [];
      if (state.imageLicenceAAJI.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "KARTU LISENSI AAJI",
          name: "KARTU LISENSI AAJI",
          stringBase: state.imageLicenceAAJI.value,
        ));
      }
      if (state.imageLicenceAASI.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "KARTU LISENSI AASI",
          name: "KARTU LISENSI AASI",
          stringBase: state.imageLicenceAASI.value,
        ));
      }
      if (state.imageLicenceAAUI.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "KARTU LISENSI AAUI",
          name: "KARTU LISENSI AAUI",
          stringBase: state.imageLicenceAAJI.value,
        ));
      }
      if (state.kkImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "KARTU KELUARGA",
          name: "KARTU KELUARGA",
          stringBase: state.kkImage.value,
        ));
      }

      if (state.identityImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "KTP",
          name: "KTP",
          stringBase: state.identityImage.value,
        ));
      }

      if (state.identitySelfieImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "FOTO DIRI BESERTA KTP",
          name: "FOTO DIRI BESERTA KTP",
          stringBase: state.identitySelfieImage.value,
        ));
      }
      int failureTotal = 0;
      for (var element in listDoc) {
        final result =
            await candidateRepository.addRegisterCandidateDoc(element);
        await result.when(
            success: (response) async {},
            failure: (error) {
              failureTotal++;
            });
      }
      return failureTotal;
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return 1;
    }
  }
}
