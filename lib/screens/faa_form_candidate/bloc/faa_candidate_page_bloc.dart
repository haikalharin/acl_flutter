import 'dart:async';

import 'package:acl_flutter/common/validators/email_validator.dart';
import 'package:acl_flutter/common/validators/handphone_validator.dart';
import 'package:acl_flutter/common/validators/phone_validator.dart';
import 'package:acl_flutter/data/model/candidate/request_candidate_doc_model.dart';
import 'package:acl_flutter/data/model/candidate_faa/education_candidate_model.dart';
import 'package:acl_flutter/data/model/master_data_model/master_data_model.dart';
import 'package:acl_flutter/data/model/sepouse/request_sepouse_model.dart';
import 'package:acl_flutter/data/repository/candidate_faa_repository/candidate_faa_repository.dart';
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
import '../../../data/model/candidate_faa/add_candidate_work_experience_model.dart';
import '../../../data/model/login_model/login_model.dart';
import '../../../data/repository/candidate/candidate_repository.dart';

part 'faa_candidate_page_event.dart';

part 'faa_candidate_page_state.dart';

class FaaCandidatePageBloc
    extends Bloc<FaaCandidatePageEvent, FaaCandidatePageState> {
  final CandidateRepository candidateRepository;
  final CandidateFaaRepository candidateFaaRepository;

  FaaCandidatePageBloc({
    required this.candidateRepository,
    required this.candidateFaaRepository,
  }) : super(AddAgentPageInitial()) {
    on<TabTypeInputEvent>(tabTypeExperienceInput);
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

    ///Work Experience
    on<CheckEmployeeInputEvent>(checkEmployeeInput);
    on<UnitNameExperienceInputEvent>(unitNameExperienceInput);
    on<LastDepartmentExperienceInputEvent>(lastDepartmentExperienceInput);
    on<DirectLeaderExperienceInputEvent>(directLeaderExperienceInput);
    on<CompanyNameExperienceInputEvent>(companyNameExperienceInput);
    on<CompanyTypeExperienceInputEvent>(companyTypeExperienceInput);
    on<DepartmentExperienceInputEvent>(departmentExperienceInput);
    on<CheckStillWorkingInputEvent>(checkStillWorkingInput);
    on<StartWorkingExperienceInputEvent>(startWorkingExperienceInput);
    on<EndWorkingExperienceInputEvent>(endWorkingExperienceInput);
    on<StatusEmployeeInputEvent>(statusEmployeeInput);
    on<AddWorkingExperienceEvent>(addWorkingExperience);
    on<SubmitWorkingExperienceEvent>(submitWorkingExperience);

    ///Education
    on<EducationLevelInputEvent>(educationLevelInput);
    on<EducationPlaceNameInputEvent>(educationPlaceNameInput);
    on<EducationDescriptionInputEvent>(educationDescriptionInput);
    on<EducationStartInputEvent>(educationStartInput);
    on<EducationEndInputEvent>(educationEndInput);
    on<EducationStatusInputEvent>(statusEducationInput);
    on<CheckStillLearnInputEvent>(checkStillLearnInput);
    on<AddEducationEvent>(addEducation);
    on<SubmitEducationEvent>(submitEducation);

  }

  Future<void> addAgentPageInitial(FaaCandidatePageInitialEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(AddAgentPageInitial());
  }

  Future<void> fetchMasterData(
      FetchMasterDataEvent event, Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    try {
      MasterDataModel masterDataModel = await SecureStorage().getMasterData();
      if (masterDataModel != MasterDataModel()) {
        emit(state.copyWith(
            masterDataModel: masterDataModel,
            message: 'success-get-master-data',
            submitStatus: FormzSubmissionStatus.success));
      } else {
        final result = await candidateRepository.fetchMasterData();
        result.when(success: (response) {
          emit(state.copyWith(
              masterDataModel: response.data,
              message: 'success-get-master-data',
              submitStatus: FormzSubmissionStatus.success));
        }, failure: (error) {
          emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
        });
      }
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
        SecureStorage().setCandidateDataFaa(response.data);
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
    var month = event.dob.month.toString().length == 1
        ? '0${event.dob.month}'
        : event.dob.month;
    var day = event.dob.day.toString().length == 1
        ? '0${event.dob.day}'
        : event.dob.day;
    var dateTime = "${event.dob.year}-$month-$day";
    final value = MandatoryFieldValidator.dirty(dateTime);
    emit(state.copyWith(
      dobString: value,
      dob: event.dob,
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
          dob: state.dobString.value,
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
            dob: state.dobString.value,
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

  ///Work Experience

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

  Future<void> statusEmployeeInput(StatusEmployeeInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      checkIsEmployee: value,
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
        companyName: const MandatoryFieldValidator.pure(),
        unitName: const MandatoryFieldValidator.pure(),
        department: const MandatoryFieldValidator.pure(),
        startWorking: const MandatoryFieldValidator.pure(),
        startWorkingDate: null,
        endWorking: const MandatoryFieldValidator.pure(),
        endWorkingDate: null,
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

  Future<void> submitWorkingExperience(SubmitWorkingExperienceEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      submitStatus: FormzSubmissionStatus.inProgress,
    ));
    if (state.isValid) {
      try {
        if (state.addCompanyModel == null &&
            state.checkIsEmployee.value == 'tidak') {
          emit(state.copyWith(
            message: 'success-submit-work-experience',
            submitStatus: FormzSubmissionStatus.success,
          ));
        } else {
          final result = await candidateFaaRepository
              .addCandidateWorkExperience(AddCandidateWorkExperienceModel(
                  candidateId: state.candidateDataModel?.data?.id.toString(),
                  companyName: state.addCompanyModel?.companyName,
                  startDate: state.addCompanyModel?.startWorking,
                  endDate: state.addCompanyModel?.endWorking,
                  companyType: state.addCompanyModel?.companyType,
                  jobDescription: state.addCompanyModel?.department));

          result.when(
              success: (response) {
                emit(state.copyWith(
                  message: 'success-submit-work-experience',
                  submitStatus: FormzSubmissionStatus.success,
                ));
              },
              failure: (error) {});
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  ///Education
  ///
  ///   on<EducationLevelInputEvent>(educationLevelInput);
  //     on<EducationPlaceNameInputEvent>(educationPlaceNameInput);
  //     on<EducationDescriptionInputEvent>(educationDescriptionInput);
  //     on<EducationStartInputEvent>(educationStartInput);
  //     on<EducationEndInputEvent>(educationEndInput);
  //     on<StatusEducationInputEvent>(statusEducationInput);
  //     on<CheckStillLearnInputEvent>(checkStillLearnInput);
  //     on<AddEducationEvent>(addEducation);
  //     on<SubmitEducationEvent>(submitEducation);
  Future<void> educationLevelInput(EducationLevelInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = DropdownFieldValidator.dirty(event.value.id??0);
    emit(state.copyWith(
      educationLevelId: value,
      educationLevel: event.value,
    ));
  }

  Future<void> educationPlaceNameInput(EducationPlaceNameInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      educationPlaceName: value,
    ));
  }

  Future<void> educationDescriptionInput(EducationDescriptionInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      department: value,
    ));
  }

  Future<void> educationStartInput(
      EducationStartInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    var month = event.educationStart.month.toString().length == 1
        ? '0${event.educationStart.month}'
        : event.educationStart.month;
    var day = event.educationStart.day.toString().length == 1
        ? '0${event.educationStart.day}'
        : event.educationStart.day;
    var dateTime = "${event.educationStart.year}-$month-$day";
    final value = MandatoryFieldValidator.dirty(dateTime);
    emit(state.copyWith(
      startWorking: value,
      startWorkingDate: event.educationStart,
    ));
  }

  Future<void> educationEndInput(EducationEndInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    var month = event.educationEnd.month.toString().length == 1
        ? '0${event.educationEnd.month}'
        : event.educationEnd.month;
    var day = event.educationEnd.day.toString().length == 1
        ? '0${event.educationEnd.day}'
        : event.educationEnd.day;
    var dateTime = "${event.educationEnd.year}-$month-$day";
    final value = MandatoryFieldValidator.dirty(dateTime);
    emit(state.copyWith(
      endWorking: value,
      endWorkingDate: event.educationEnd,
    ));
  }

  Future<void> statusEducationInput(EducationStatusInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      educationStatus: value,
    ));
  }

  Future<void> checkStillLearnInput(CheckStillLearnInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = event.isCheck;
    emit(state.copyWith(
      checkedStillLearning: value,
    ));
  }

  Future<void> addEducation(AddEducationEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      isJustAddEducation: true,
      submitStatus: FormzSubmissionStatus.inProgress,
    ));
    if (event.isDelete) {
      emit(state.copyWith(
        addEducationModel: AddEducationModel(),
        educationLevelId: const DropdownFieldValidator.pure(),
        educationPlaceName: const MandatoryFieldValidator.pure(),
        educationDescription: const MandatoryFieldValidator.pure(),
        educationStart: const MandatoryFieldValidator.pure(),
        educationStartDate: null,
        educationEnd: const MandatoryFieldValidator.pure(),
        educationEndDate: null,
        educationStatus: const MandatoryFieldValidator.pure(),
        submitStatus: FormzSubmissionStatus.success,
      ));
    } else {
      if (state.isValid) {
        try {
          final value = AddEducationModel(
            level: state.educationLevelId.value,
            schoolName: state.educationPlaceName.value,
            description: state.educationDescription.value,
            checkedStillLearning: state.checkedStillLearning,
            startLearning: state.educationStart.value,
            startLearningDate: state.educationStartDate,
            endLearning: state.educationEnd.value,
            endLearningDate: state.educationEndDate,
            status: state.educationStatus.value,
          );
          emit(state.copyWith(
            addEducationModel: value,
            isJustAddEducation: false,
            message: 'success-add-education',
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

  Future<void> submitEducation(SubmitEducationEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      submitStatus: FormzSubmissionStatus.inProgress,
    ));
    if (state.isValid) {
      try {
        if (state.addCompanyModel == null &&
            state.checkIsEmployee.value == 'tidak') {
          emit(state.copyWith(
            message: 'success-submit-work-experience',
            submitStatus: FormzSubmissionStatus.success,
          ));
        } else {
          final result = await candidateFaaRepository
              .addCandidateEducation(EducationCandidateModel(
              candidateId: state.candidateDataModel?.data?.id.toString(),
              educationType: state.addEducationModel?.level.toString(),
              educationName: state.addEducationModel?.schoolName,
              educationDescription: state.addEducationModel?.description,
              startDate: state.addEducationModel?.startLearning,
              endDate: state.addEducationModel?.endLearning,
              educationStatus: state.addEducationModel?.status));

          result.when(
              success: (response) {
                emit(state.copyWith(
                  message: 'success-submit-education',
                  submitStatus: FormzSubmissionStatus.success,
                ));
              },
              failure: (error) {});
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
}
