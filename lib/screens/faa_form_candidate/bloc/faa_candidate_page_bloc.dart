import 'dart:async';

import 'package:acl_flutter/common/validators/email_validator.dart';
import 'package:acl_flutter/common/validators/handphone_validator.dart';
import 'package:acl_flutter/common/validators/phone_validator.dart';
import 'package:acl_flutter/data/model/candidate/request_candidate_doc_model.dart';
import 'package:acl_flutter/data/model/candidate_faa/education_candidate_model.dart';
import 'package:acl_flutter/data/model/candidate_faa/family_card_model.dart';
import 'package:acl_flutter/data/model/candidate_faa/private_data_candidate_request_model.dart';
import 'package:acl_flutter/data/model/candidate_faa/request_families_data.dart';
import 'package:acl_flutter/data/model/documents/documents_response_model.dart';
import 'package:acl_flutter/data/model/master_data_model/master_data_model.dart';
import 'package:acl_flutter/data/repository/candidate_faa/candidate_faa_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';

import '../../../common/validators/identity_no_validator.dart';
import '../../../common/validators/mandatory_dropdown_validator.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import 'package:equatable/equatable.dart';

import '../../../common/validators/zipcode_validator.dart';
import '../../../core/local_storage/secure_storage/secure_storage.dart';
import '../../../core/network/api_result.dart';
import '../../../core/router/routes.dart';
import '../../../data/model/candidate/candidate_data_model.dart';
import '../../../data/model/candidate/candidate_model.dart';
import '../../../data/model/candidate/candidate_register_model.dart';
import '../../../data/model/candidate/request_candidate_model.dart';
import '../../../data/model/candidate/request_pending_simple_checking_model.dart';
import '../../../data/model/candidate_faa/add_candidate_work_experience_model.dart';
import '../../../data/model/candidate_faa/response_families_data.dart';
import '../../../data/model/login_model/login_model.dart';
import '../../../data/model/response_model/response_model.dart';
import '../../../data/model/sepouse/request_sepouse_model.dart' as request;
import '../../../data/repository/candidate/candidate_repository.dart';
import '../screen/expansion_widget/private/widget/custom_card_list_builder.dart';

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

    ///Private Data
    on<FirstNameInputEvent>(firstNameInput);
    on<MiddleNameInputEvent>(middleNameInput);
    on<LastNameInputEvent>(lastNameInput);
    on<PositionInputEvent>(positionInput);
    on<IdentityNoInputEvent>(identityNoInput);
    on<KkNoInputEvent>(kkNoInput);
    on<MartialStatusInputEvent>(martialStatusInput);
    on<DobInputEvent>(dobInput);
    on<PobInputEvent>(pobInput);
    on<GenderInputEvent>(genderInput);
    on<NationalityInputEvent>(nationalityInput);
    on<ReligionInputEvent>(religionInput);
    on<AddressInputEvent>(addressInput);
    on<RtRwInputEvent>(rtRwInput);
    on<KecKelInputEvent>(kecKelInput);
    on<PostalCodeInputEvent>(postalCodeInput);
    on<CountryInputEvent>(countryInput);
    on<ProvinceInputEvent>(provinceInput);
    on<CityInputEvent>(cityInput);
    on<PhoneInputEvent>(phoneInput);
    on<HandphoneInputEvent>(handphoneInput);
    on<EmailInputEvent>(emailInput);
    on<OccupationInputEvent>(occupationInput);
    on<LastWorkingExperienceInputEvent>(lastWorkingExperienceInput);
    on<CheckedLastResignDateInputEvent>(checkedLastResignDateInput);
    on<LastResignDateInputEvent>(lastResignDateInput);
    on<CheckedTerminationDateInputEvent>(checkedTerminationDateInput);
    on<TerminationDateInputEvent>(terminationDateInput);
    on<PrivateImageInputEvent>(privateImageInput);
    on<IdentityImageInputEvent>(identityImageInput);
    on<IdentitySelfieImageInputEvent>(identitySelfieImageInput);
    on<TerminationImageInputEvent>(terminationImageInput);
    on<NotTwistingImageInputEvent>(notTwistingImageInput);
    on<HeirsRelationInputEvent>(heirsRelationInput);
    on<AajiCheckedInputEvent>(aajiCheckedInput);
    on<AajiNoInputEvent>(noLicenceAAJIInput);
    on<AajiImageInputEvent>(imageLicenceAAJIInput);
    on<AasiCheckedInputEvent>(aasiCheckedInput);
    on<AasiNoInputEvent>(noLicenceAASIInput);
    on<AasiImageInputEvent>(imageLicenceAASIInput);
    on<AauiCheckedInputEvent>(aauiCheckedInput);
    on<AauiNoInputEvent>(noLicenceAAUIInput);
    on<AauiImageInputEvent>(imageLicenceAAUIInput);
    on<NpwpNoInputEvent>(npwpNoInput);
    on<BankNoInputEvent>(bankNoInput);
    on<BankUserNameInputEvent>(bankUserNameInput);
    on<BankNameInputEvent>(bankNameInput);
    on<BankBranchInputEvent>(bankBranchInput);
    on<NpwpImageInputEvent>(npwpImageInput);
    on<BankUserBookImageInputEvent>(bankUserBookImageInput);
    on<SourceInformationInputEvent>(sourceInformationInput);
    on<AppendixInputEvent>(appendixInput);
    on<AppendixImageInputEvent>(appendixImageInput);
    on<FaaAddAgentSubmittedEvent>(faaAddAgentSubmitted);
    on<FaaAddAgentDocSubmittedEvent>(faaAddAgentDocSubmitted);
    on<AajiPrevCompanyInputEvent>(aajiPrevCompanyInput);
    on<AajiLastDateCheckedInputEvent>(aajiLastDateCheckedInput);
    on<AajiLastDateInputEvent>(aajiLastDateInput);
    on<AajiTerminationImageInputEvent>(imageTerminationAAJIInput);
    on<AajiNotTwistingImageInputEvent>(imageNotTwistingAAJIInput);
    on<AajiMobileActivationExamImageInputEvent>(
        imageMobileActivationExamAAJIInput);

    on<AasiPrevCompanyInputEvent>(aasiPrevCompanyInput);
    on<AasiLastDateCheckedInputEvent>(aasiLastDateCheckedInput);
    on<AasiLastDateInputEvent>(aasiLastDateInput);
    on<AasiTerminationImageInputEvent>(imageTerminationAASIInput);
    on<AasiNotTwistingImageInputEvent>(imageNotTwistingAASIInput);
    on<AasiMobileActivationExamImageInputEvent>(
        imageMobileActivationExamAASIInput);

    on<AauiPrevCompanyInputEvent>(aauiPrevCompanyInput);
    on<AauiLastDateCheckedInputEvent>(aauiLastDateCheckedInput);
    on<AauiLastDateInputEvent>(aauiLastDateInput);
    on<AauiTerminationImageInputEvent>(imageTerminationAAUIInput);
    on<AauiNotTwistingImageInputEvent>(imageNotTwistingAAUIInput);
    on<AauiMobileActivationExamImageInputEvent>(
        imageMobileActivationExamAAUIInput);
    on<SpouseIsAgentInputEvent>(spouseIsAgentInput);
    on<FirstNamePartnerInputEvent>(firstNamePartnerInput);
    on<RelationPartnerInputEvent>(relationPartnerInput);
    on<DirectUnitNameInputEvent>(directUnitNameInput);
    on<PositionSpouseInputEvent>(positionSpouseInput);
    on<AgentCodeInputEvent>(agentCodeInput);

    //todo
    on<PutDataTypeEvent>(putDataType);
    on<DeleteDataFamilyEvent>(deleteDataFamilyEvent);
    on<FamilyPersonNameInputEvent>(familyPersonNameInput);
    on<FamilyPersonRelationInputEvent>(familyPersonRelationInput);
    on<FamilyDirectNameInputEvent>(familyDirectNameInput);
    on<FamilyPositionInputEvent>(familyPositionInput);
    on<FamilyAgentCodeInputEvent>(familyAgentCodeInput);
    on<FamilyCompanyInputEvent>(familyCompanyInput);
    on<FamilyDepartmentInputEvent>(familyDepartmentInput);
    on<SubmitFamiliesDataEvent>(submitFamiliesData);


    //todo

    on<KkImageInputEvent>(kkImageInput);
    on<MarriedCheckedInputEvent>(marriedCheckedInputEvent);
    on<MiddleNamePartnerInputEvent>(middleNamePartnerInput);
    on<LastNamePartnerInputEvent>(lastNamePartnerInput);
    on<DobPartnerInputEvent>(dobPartnerInput);
    on<PartnerIdentityNoInputEvent>(partnerIdentityNoInput);
    on<FaaCandidatePageInitialEvent>(faaCandidatePageInitial);
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

  Future<void> faaCandidatePageInitial(FaaCandidatePageInitialEvent event,
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
      await result.when(success: (responseCandidateDetail) async {
        List<CandidateDataModel> listData = responseCandidateDetail.data;
        SecureStorage().setCandidateDataFaa(listData.first);
        LoginModel user = await SecureStorage().getUser();

        final result = await candidateRepository.getCandidateDataDoc(
            agentCode: user.uid ?? '', candidateId: event.candidateId);
        await result.when(success: (response) async {
          var privateImage = const MandatoryFieldValidator.pure();
          var identityImage = const MandatoryFieldValidator.pure();
          var identitySelfiImage = const MandatoryFieldValidator.pure();
          var terminationImage = const MandatoryFieldValidator.pure();
          var notTwistingImage = const MandatoryFieldValidator.pure();
          var imageLicenceAAJI = const MandatoryFieldValidator.pure();
          var imageLicenceAASI = const MandatoryFieldValidator.pure();
          var imageLicenceAAUI = const MandatoryFieldValidator.pure();
          var martialStatusId = const DropdownFieldValidator.pure();
          var checkedValueAAJI = false;
          var checkedValueAASI = false;
          var checkedValueAAUI = false;
          List<DocumentsResponseModel> listImage = response.data;

          for (var element in listImage) {
            if (element.key == 30010101) {
              privateImage = MandatoryFieldValidator.dirty(element.value ?? '');
            }
            if (element.key == 11010201) {
              identityImage =
                  MandatoryFieldValidator.dirty(element.value ?? '');
            }
            if (element.key == 40010005) {
              identitySelfiImage =
                  MandatoryFieldValidator.dirty(element.value ?? '');
            }
            if (element.key == 30020117) {
              notTwistingImage =
                  MandatoryFieldValidator.dirty(element.value ?? '');
            }
            if (element.key == 30020123) {
              terminationImage =
                  MandatoryFieldValidator.dirty(element.value ?? '');
            }
            if (element.key == 30020110) {
              imageLicenceAAJI =
                  MandatoryFieldValidator.dirty(element.value ?? '');
              checkedValueAAJI = true;
            }
            if (element.key == 30020110) {
              imageLicenceAAJI =
                  MandatoryFieldValidator.dirty(element.value ?? '');
              checkedValueAAJI = true;
            }
            if (element.key == 30020110) {
              imageLicenceAAJI =
                  MandatoryFieldValidator.dirty(element.value ?? '');
              checkedValueAAJI = true;
            }
            if (element.key == 30020110) {
              imageLicenceAAJI =
                  MandatoryFieldValidator.dirty(element.value ?? '');
              checkedValueAAJI = true;
            }

            if (element.key == 30020131) {
              imageLicenceAASI =
                  MandatoryFieldValidator.dirty(element.value ?? '');
              checkedValueAASI = true;
            }

            if (element.key == 30020144) {
              imageLicenceAAUI =
                  MandatoryFieldValidator.dirty(element.value ?? '');
              checkedValueAASI = true;
            }
          }

          final resultCandidateFamily = await candidateRepository
              .getCandidateFamilyData(event.candidateId);
          FamilyCardModel familyCardModel = FamilyCardModel();
          resultCandidateFamily.when(success: (responseCandidateFamily) async {
            familyCardModel =responseCandidateFamily.data;
            martialStatusId = const DropdownFieldValidator.dirty(11);
          }, failure: (error) {
            martialStatusId = const DropdownFieldValidator.pure();
          });
          List<AajicityMasterReference> listMartialModel = [];
          AajicityMasterReference? martialStatusModel;
         listMartialModel = state.masterDataModel?.masterData
              ?.masterReferenceAll?.maritalstatus?.masterReference
              ?.where((element) =>
          element.id == (martialStatusId.value)).toList()??[];
         if(listMartialModel.isNotEmpty){
           martialStatusModel = listMartialModel.single;
         }

          emit(state.copyWith(

              ///todo
              candidateDataModel: listData.first,
              firstName: listData.first.firstName!.isNotEmpty
                  ? MandatoryFieldValidator.dirty(
                      listData.first.firstName ?? '')
                  : const MandatoryFieldValidator.pure(),
              martialStatusId: martialStatusId,
              provinceId: listData.first.province != null
                  ? DropdownFieldValidator.dirty(listData.first.province ?? 0)
                  : const DropdownFieldValidator.pure(),
              prevCompanyAAJIId: listData.first.prevCompany != null
                  ? DropdownFieldValidator.dirty(
                      listData.first.prevCompany ?? 0)
                  : const DropdownFieldValidator.pure(),
              prevCompanyAASIId: listData.first.prevCompanyAasi != null
                  ? DropdownFieldValidator.dirty(
                      listData.first.prevCompanyAasi ?? 0)
                  : const DropdownFieldValidator.pure(),
              prevCompanyAAUIId: listData.first.prevCompanyAaui != null
                  ? DropdownFieldValidator.dirty(
                      listData.first.prevCompanyAaui ?? 0)
                  : const DropdownFieldValidator.pure(),
              privateImage: privateImage,
              identityImage: identityImage,
              identitySelfieImage: identitySelfiImage,
              terminationImage: terminationImage,
              notTwistingImage: notTwistingImage,
              imageLicenceAAJI: imageLicenceAAJI,
              imageLicenceAASI: imageLicenceAASI,
              imageLicenceAAUI: imageLicenceAAUI,
              checkedPrevCompanyValueAAJI:
                  listData.first.prevCompany != null ? true : false,
              checkedPrevCompanyValueAASI:
                  listData.first.prevCompanyAasi != null ? true : false,
              checkedPrevCompanyValueAAUI:
                  listData.first.prevCompanyAaui != null ? true : false,
              checkedValueAAJI: checkedValueAAJI,
              checkedValueAASI: checkedValueAASI,
              checkedValueAAUI: checkedValueAAUI,
              martialStatus: martialStatusModel,
              candidateDataFamilyModel: familyCardModel,
              message: 'success-get-candidate-data',
              submitStatus: FormzSubmissionStatus.success));
        }, failure: (error) {
          emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
        });
      }, failure: (error) {
        emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
      });
    } catch (error) {
      emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
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

  Future<void> positionInput(
      PositionInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    if (event.value.id == 0 || event.value.id == null) {
      const valueId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        positionId: valueId,
        position: null,
      ));
    } else {
      final valueId = DropdownFieldValidator.dirty(event.value.id ?? 0);
      emit(state.copyWith(
        positionId: valueId,
        position: event.value,
      ));
    }
  }

  Future<void> identityNoInput(
      IdentityNoInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final identityNo = IdentityNoValidator.dirty(event.identityNo);
    emit(state.copyWith(
      identityNo: identityNo,
    ));
  }

  Future<void> martialStatusInput(MartialStatusInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    if (event.value.id == 0 || event.value.id == null) {
      const valueId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        martialStatusId: valueId,
        martialStatus: null,
      ));
    } else {
      final valueId = DropdownFieldValidator.dirty(event.value.id ?? 0);
      emit(state.copyWith(
        martialStatusId: valueId,
        martialStatus: event.value,
      ));
    }
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

  Future<void> pobInput(
      PobInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final pob = MandatoryFieldValidator.dirty(event.pob);
    emit(state.copyWith(
      pob: pob,
    ));
  }

  Future<void> genderInput(
      GenderInputEvent event, Emitter<FaaCandidatePageState> emit) async {
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

  Future<void> nationalityInput(
      NationalityInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      nationality: value,
    ));
  }

  Future<void> religionInput(
      ReligionInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    if (event.value.id == 0 || event.value.id == null) {
      const valueId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        religionId: valueId,
        religion: null,
      ));
    } else {
      final valueId = DropdownFieldValidator.dirty(event.value.id ?? 0);
      emit(state.copyWith(
        religionId: valueId,
        religion: event.value,
      ));
    }
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

  Future<void> phoneInput(
      PhoneInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final value = PhoneValidator.dirty(event.value);
    emit(state.copyWith(
      phone: value,
    ));
  }

  Future<void> handphoneInput(
      HandphoneInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final value = HandphoneValidator.dirty(event.value);
    emit(state.copyWith(
      handphone: value,
    ));
  }

  Future<void> emailInput(
      EmailInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final value = EmailValidator.dirty(event.value);
    emit(state.copyWith(
      email: value,
    ));
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

  Future<void> lastWorkingExperienceInput(LastWorkingExperienceInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      lastWorkExperience: value,
    ));
  }

  Future<void> checkedLastResignDateInput(CheckedLastResignDateInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueLastResign: event.checkedLastResign,
    ));
  }

  Future<void> lastResignDateInput(LastResignDateInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    var month = event.date.month.toString().length == 1
        ? '0${event.date.month}'
        : event.date.month;
    var day = event.date.day.toString().length == 1
        ? '0${event.date.day}'
        : event.date.day;
    var dateTime = "${event.date.year}-$month-$day";
    final value = MandatoryFieldValidator.dirty(dateTime);
    emit(state.copyWith(
      lastResignDateString: value,
      lastResignDate: event.date,
    ));
  }

  Future<void> checkedTerminationDateInput(
      CheckedTerminationDateInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueTermination: event.checkedTerminationDateInput,
    ));
  }

  Future<void> terminationDateInput(TerminationDateInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    var month = event.date.month.toString().length == 1
        ? '0${event.date.month}'
        : event.date.month;
    var day = event.date.day.toString().length == 1
        ? '0${event.date.day}'
        : event.date.day;
    var dateTime = "${event.date.year}-$month-$day";
    final value = MandatoryFieldValidator.dirty(dateTime);
    emit(state.copyWith(
      terminationDateString: value,
      terminationDate: event.date,
    ));
  }

  Future<void> privateImageInput(
      PrivateImageInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final image = MandatoryFieldValidator.dirty(event.image);
    emit(state.copyWith(
      privateImage: image,
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

  Future<void> terminationImageInput(TerminationImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final image = MandatoryFieldValidator.dirty(event.image);
    emit(state.copyWith(
      terminationImage: image,
    ));
  }

  Future<void> notTwistingImageInput(NotTwistingImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final image = MandatoryFieldValidator.dirty(event.image);
    emit(state.copyWith(
      terminationImage: image,
    ));
  }

  Future<void> heirsRelationInput(HeirsRelationInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    if (event.value.id == 0 || event.value.id == null) {
      const value = DropdownFieldValidator.pure();
      emit(state.copyWith(
        heirsRelationId: value,
        heirsRelation: null,
      ));
    } else {
      final occupationId = DropdownFieldValidator.dirty(event.value.id ?? 0);
      emit(state.copyWith(
        heirsRelationId: occupationId,
        heirsRelation: event.value,
      ));
    }
  }

  Future<void> aajiCheckedInput(
      AajiCheckedInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueAAJI: event.aajiChecked,
    ));
  }

  Future<void> aajiPrevCompanyInput(AajiPrevCompanyInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    if (event.prevCompany.id == 0 || event.prevCompany.id == null) {
      const prevCompanyId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        prevCompanyAAJIId: prevCompanyId,
        prevCompanyAAJI: null,
      ));
    } else {
      final prevCompanyId =
          DropdownFieldValidator.dirty(event.prevCompany.id ?? 0);
      emit(state.copyWith(
        prevCompanyAAJIId: prevCompanyId,
        prevCompanyAAJI: event.prevCompany,
      ));
    }
  }

  Future<void> noLicenceAAJIInput(
      AajiNoInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final noLicenceAAJI = MandatoryFieldValidator.dirty(event.aajiNo);
    emit(state.copyWith(
      noLicenceAAJI: noLicenceAAJI,
      checkedValueAAJI: noLicenceAAJI.isValid,
    ));
  }

  Future<void> aajiLastDateCheckedInput(AajiLastDateCheckedInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedLastDateValueAAJI: event.aajiLastDateChecked,
    ));
  }

  Future<void> aajiLastDateInput(
      AajiLastDateInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    var month = event.value.month.toString().length == 1
        ? '0${event.value.month}'
        : event.value.month;
    var day = event.value.day.toString().length == 1
        ? '0${event.value.day}'
        : event.value.day;
    var dateTime = "${event.value.year}-$month-$day";
    final value = MandatoryFieldValidator.dirty(dateTime);
    emit(state.copyWith(
      dateLastDateValueAAJIString: value,
      dateLastDateValueAAJI: event.value,
    ));
  }

  Future<void> imageTerminationAAJIInput(AajiTerminationImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final valueImage = MandatoryFieldValidator.dirty(event.valueImage);
    emit(state.copyWith(
      terminationValueAAJIImage: valueImage,
    ));
  }

  Future<void> imageNotTwistingAAJIInput(AajiNotTwistingImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final valueImage = MandatoryFieldValidator.dirty(event.valueImage);
    emit(state.copyWith(
      notTwistingValueAAJIImage: valueImage,
    ));
  }

  Future<void> imageMobileActivationExamAAJIInput(
      AajiMobileActivationExamImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final valueImage = MandatoryFieldValidator.dirty(event.valueImage);
    emit(state.copyWith(
      mobileActivationExamValueAAJIImage: valueImage,
    ));
  }

  Future<void> imageLicenceAAJIInput(
      AajiImageInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final imageLicenceAAJI = MandatoryFieldValidator.dirty(event.aajiImage);
    emit(state.copyWith(
      imageLicenceAAJI: imageLicenceAAJI,
    ));
  }

  Future<void> aasiCheckedInput(
      AasiCheckedInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueAASI: event.aasiChecked,
    ));
  }

  Future<void> aasiPrevCompanyInput(AasiPrevCompanyInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    if (event.prevCompany.id == 0 || event.prevCompany.id == null) {
      const prevCompanyId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        prevCompanyAASIId: prevCompanyId,
        prevCompanyAASI: null,
      ));
    } else {
      final prevCompanyId =
          DropdownFieldValidator.dirty(event.prevCompany.id ?? 0);
      emit(state.copyWith(
        prevCompanyAASIId: prevCompanyId,
        prevCompanyAASI: event.prevCompany,
      ));
    }
  }

  Future<void> noLicenceAASIInput(
      AasiNoInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final noLicenceAASI = MandatoryFieldValidator.dirty(event.aasiNo);
    emit(state.copyWith(
      noLicenceAASI: noLicenceAASI,
      checkedValueAASI: noLicenceAASI.isValid,
    ));
  }

  Future<void> aasiLastDateCheckedInput(AasiLastDateCheckedInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedLastDateValueAASI: event.aasiLastDateChecked,
    ));
  }

  Future<void> aasiLastDateInput(
      AasiLastDateInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    var month = event.value.month.toString().length == 1
        ? '0${event.value.month}'
        : event.value.month;
    var day = event.value.day.toString().length == 1
        ? '0${event.value.day}'
        : event.value.day;
    var dateTime = "${event.value.year}-$month-$day";
    final value = MandatoryFieldValidator.dirty(dateTime);
    emit(state.copyWith(
      dateLastDateValueAASIString: value,
      dateLastDateValueAASI: event.value,
    ));
  }

  Future<void> imageTerminationAASIInput(AasiTerminationImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final valueImage = MandatoryFieldValidator.dirty(event.valueImage);
    emit(state.copyWith(
      terminationValueAASIImage: valueImage,
    ));
  }

  Future<void> imageNotTwistingAASIInput(AasiNotTwistingImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final valueImage = MandatoryFieldValidator.dirty(event.valueImage);
    emit(state.copyWith(
      notTwistingValueAASIImage: valueImage,
    ));
  }

  Future<void> imageMobileActivationExamAASIInput(
      AasiMobileActivationExamImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final valueImage = MandatoryFieldValidator.dirty(event.valueImage);
    emit(state.copyWith(
      mobileActivationExamValueAASIImage: valueImage,
    ));
  }

  Future<void> imageLicenceAASIInput(
      AasiImageInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final imageLicenceAASI = MandatoryFieldValidator.dirty(event.aasiImage);
    emit(state.copyWith(
      imageLicenceAASI: imageLicenceAASI,
    ));
  }

  Future<void> aauiCheckedInput(
      AauiCheckedInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueAAUI: event.aauiChecked,
    ));
  }

  Future<void> aauiPrevCompanyInput(AauiPrevCompanyInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    if (event.prevCompany.id == 0 || event.prevCompany.id == null) {
      const prevCompanyId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        prevCompanyAAUIId: prevCompanyId,
        prevCompanyAAUI: null,
      ));
    } else {
      final prevCompanyId =
          DropdownFieldValidator.dirty(event.prevCompany.id ?? 0);
      emit(state.copyWith(
        prevCompanyAAUIId: prevCompanyId,
        prevCompanyAAUI: event.prevCompany,
      ));
    }
  }

  Future<void> noLicenceAAUIInput(
      AauiNoInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final noLicenceAAUI = MandatoryFieldValidator.dirty(event.aauiNo);
    emit(state.copyWith(
      noLicenceAAUI: noLicenceAAUI,
      checkedValueAAUI: noLicenceAAUI.isValid,
    ));
  }

  Future<void> aauiLastDateCheckedInput(AauiLastDateCheckedInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedLastDateValueAAUI: event.aauiLastDateChecked,
    ));
  }

  Future<void> aauiLastDateInput(
      AauiLastDateInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    var month = event.value.month.toString().length == 1
        ? '0${event.value.month}'
        : event.value.month;
    var day = event.value.day.toString().length == 1
        ? '0${event.value.day}'
        : event.value.day;
    var dateTime = "${event.value.year}-$month-$day";
    final value = MandatoryFieldValidator.dirty(dateTime);
    emit(state.copyWith(
      dateLastDateValueAAUIString: value,
      dateLastDateValueAAUI: event.value,
    ));
  }

  Future<void> imageTerminationAAUIInput(AauiTerminationImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final valueImage = MandatoryFieldValidator.dirty(event.valueImage);
    emit(state.copyWith(
      terminationValueAAUIImage: valueImage,
    ));
  }

  Future<void> imageNotTwistingAAUIInput(AauiNotTwistingImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final valueImage = MandatoryFieldValidator.dirty(event.valueImage);
    emit(state.copyWith(
      notTwistingValueAAUIImage: valueImage,
    ));
  }

  Future<void> imageMobileActivationExamAAUIInput(
      AauiMobileActivationExamImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final valueImage = MandatoryFieldValidator.dirty(event.valueImage);
    emit(state.copyWith(
      mobileActivationExamValueAAUIImage: valueImage,
    ));
  }

  Future<void> imageLicenceAAUIInput(
      AauiImageInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final imageLicenceAAUI = MandatoryFieldValidator.dirty(event.aauiImage);
    emit(state.copyWith(
      imageLicenceAAUI: imageLicenceAAUI,
    ));
  }

  Future<void> spouseIsAgentInput(SpouseIsAgentInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final spouseIsAgent = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      spouseIsAgent: spouseIsAgent,
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

  Future<void> directUnitNameInput(DirectUnitNameInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      directUnitName: value,
    ));
  }

  Future<void> positionSpouseInput(PositionSpouseInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    if (event.value.id == 0 || event.value.id == null) {
      const valueId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        spousePositionId: valueId,
        spousePosition: null,
      ));
    } else {
      final valueId = DropdownFieldValidator.dirty(event.value.id ?? 0);
      emit(state.copyWith(
        spousePositionId: valueId,
        spousePosition: event.value,
      ));
    }
  }

  Future<void> agentCodeInput(
      AgentCodeInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      agentCode: value,
    ));
  }

  //todo

  Future<void> putDataType(
      PutDataTypeEvent event, Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      putDataType: event.putDataType,
    ));
  }
  Future<void> submitFamiliesData(SubmitFamiliesDataEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    ApiResult<ResponseModel<ResponseFamiliesData>> result =
    const ApiResult.failure('');
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    if (state.isValid) {
      try {
          if (event.type == PutDataType.isAgentInAllianz) {
            result = await candidateFaaRepository.addAddFamiliesData(
                RequestFamiliesData(
                    id: event.id,
                    type: 'agent',
                    candidateId: state.candidateDataModel?.id,
                    name: state.familyPersonName.value.toUpperCase(),
                    relation: state.relationId.value.toString(),
                    directName: state.directUnitName.value.toUpperCase(),
                    role: state.familyPositionId.value.toString(),
                    agentCode: state.familyAgentCode.value.toString(),
                    company: state.familyCompany.value.toUpperCase()));
          } else if (event.type == PutDataType.isAgentInOthers) {
            result = await candidateFaaRepository.addAddFamiliesData(
                RequestFamiliesData(
                    id: event.id,
                    type: 'nonagent',
                    candidateId: state.candidateDataModel?.id,
                    name: state.familyPersonName.value.toUpperCase(),
                    relation: state.relationId.value.toString(),
                    company: state.familyCompany.value.toUpperCase()));
          } else {
            result = await candidateFaaRepository.addAddFamiliesData(
                RequestFamiliesData(
                    id: event.id,
                    type: 'employee',
                    candidateId: state.candidateDataModel?.id,
                    name: state.familyPersonName.value.toUpperCase(),
                    relation: state.relationId.value.toString(),
                    role: state.familyPositionId.value.toString(),
                    department: state.familyDepartment.value.toUpperCase(),
                    company: state.familyCompany.value.toUpperCase()));
          }

         await result.when(success: (response) async {
                      var resultFetch = await candidateFaaRepository
                .getCandidateFamiliesInCompanyData(
                state.candidateDataModel?.id ?? 0);
           await resultFetch.when(success: (responseList) async {
             List<ResponseFamiliesData> listResponseFamiliesData = responseList.data;
             List<ResponseFamiliesData> listFamilyIsAgent = [];
              List<ResponseFamiliesData> listFamilyIsAgentOthers = [];
              List<ResponseFamiliesData> listFamilyIsEmployee = [];
              if (listResponseFamiliesData.isNotEmpty) {
                listFamilyIsAgent = listResponseFamiliesData.where((element) =>
                element.type?.toLowerCase() == 'agent').toList();

                listFamilyIsAgentOthers =
                    listResponseFamiliesData.where((element) =>
                    element.type?.toLowerCase() == 'nonagent').toList();

                listFamilyIsEmployee =
                    listResponseFamiliesData.where((element) =>
                    element.type?.toLowerCase() == 'employee').toList();
              }
              emit(state.copyWith(
                  moveTo: Routes.userList,
                  message: 'success-add-families-data',
                  putDataType: PutDataType.isInit,
                  familyPersonName: const MandatoryFieldValidator.pure(),
                  familyAgentCode:  const MandatoryFieldValidator.pure(),
                  familyPersonRelation: null,
                  familyPersonRelationId: const DropdownFieldValidator.pure(),
                  familyPosition: null,
                  familyPositionId: const DropdownFieldValidator.pure(),
                  familyDepartment:  const MandatoryFieldValidator.pure(),
                  familyDirectName:  const MandatoryFieldValidator.pure(),
                  familyCompany:  const MandatoryFieldValidator.pure(),
                  listFamilyIsAgent: listFamilyIsAgent,
                  listFamilyIsAgentOthers: listFamilyIsAgentOthers,
                  listFamilyIsEmployee: listFamilyIsEmployee,
                  submitStatus: FormzSubmissionStatus.success));
            }, failure: (error) async {
              emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
            });
          }, failure: (error) async {
            emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
          });
      }catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    }
  }

  Future<void> updateFamiliesData(FaaAddAgentDocSubmittedEvent event,
      Emitter<FaaCandidatePageState> emit) async {}

  Future<void> deleteFamiliesData(FaaAddAgentDocSubmittedEvent event,
      Emitter<FaaCandidatePageState> emit) async {}



  Future<void> familyPersonNameInput(FamilyPersonNameInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      familyPersonName: value,
    ));
  }

  Future<void> deleteDataFamilyEvent(
      DeleteDataFamilyEvent event, Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
        // familyPersonName: value,
        ));
  }

  Future<void> familyPersonRelationInput(FamilyPersonRelationInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    if (event.value.id == 0 || event.value.id == null) {
      const valueId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        familyPersonRelationId: valueId,
        familyPersonRelation: null,
      ));
    } else {
      final valueId = DropdownFieldValidator.dirty(event.value.id ?? 0);
      emit(state.copyWith(
        familyPersonRelationId: valueId,
        familyPersonRelation: event.value,
      ));
    }
  }

  Future<void> familyDirectNameInput(FamilyDirectNameInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      familyDirectName: value,
    ));
  }

  Future<void> familyPositionInput(FamilyPositionInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    if (event.value.id == 0 || event.value.id == null) {
      const valueId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        familyPositionId: valueId,
        familyPosition: null,
      ));
    } else {
      final valueId = DropdownFieldValidator.dirty(event.value.id ?? 0);
      emit(state.copyWith(
        familyPositionId: valueId,
        familyPosition: event.value,
      ));
    }
  }

  Future<void> familyAgentCodeInput(FamilyAgentCodeInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      familyAgentCode: value,
    ));
  }

  Future<void> familyDepartmentInput(FamilyDepartmentInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      familyDepartment: value,
    ));
  }

  Future<void> familyCompanyInput(FamilyCompanyInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    if (event.value.isEmpty) {
      const value = MandatoryFieldValidator.pure();
      emit(state.copyWith(
        familyCompany: value,
      ));
    } else {
      final value = MandatoryFieldValidator.dirty(event.value);
      emit(state.copyWith(
        familyCompany: value,
      ));
    }
  }

  //todo

  Future<void> npwpNoInput(
      NpwpNoInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      npwpNo: value,
    ));
  }

  Future<void> bankNoInput(
      BankNoInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      bankNo: value,
    ));
  }

  Future<void> bankUserNameInput(
      BankUserNameInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      bankUserName: value,
    ));
  }

  Future<void> bankNameInput(
      BankNameInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    if (event.value.id == 0 || event.value.id == null) {
      const valueId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        bankNameId: valueId,
        bankName: null,
      ));
    } else {
      final valueId = DropdownFieldValidator.dirty(event.value.id ?? 0);
      emit(state.copyWith(
        bankNameId: valueId,
        bankName: event.value,
      ));
    }
  }

  Future<void> bankBranchInput(
      BankBranchInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      bankBranch: value,
    ));
  }

  Future<void> npwpImageInput(
      NpwpImageInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      npwpImage: value,
    ));
  }

  Future<void> bankUserBookImageInput(BankUserBookImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      bankUserBookImage: value,
    ));
  }

  Future<void> sourceInformationInput(SourceInformationInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      sourceInformation: value,
    ));
  }

  Future<void> appendixInput(
      AppendixInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    if (event.value.id == 0 || event.value.id == null) {
      const valueId = DropdownFieldValidator.pure();
      emit(state.copyWith(
        appendixValueId: valueId,
        appendixValue: null,
      ));
    } else {
      final valueId = DropdownFieldValidator.dirty(int.parse(event.value.fileNetId ?? '0'));
      emit(state.copyWith(
        appendixValueId: valueId,
        appendixValue: event.value,
      ));
    }
  }

  Future<void> appendixImageInput(AppendixImageInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = MandatoryFieldValidator.dirty(event.value);
    emit(state.copyWith(
      appendixImage: value,
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

  Future<void> marriedCheckedInputEvent(MarriedCheckedInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueMarriage: event.marriedChecked,
    ));
  }

  Future<void> faaAddAgentSubmitted(FaaAddAgentSubmittedEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    if (state.isValid) {
      try {
        LoginModel loginModel = await SecureStorage().getUser();
        final result = await candidateFaaRepository
            .addRegisterCandidatePrivateData(PrivateDataCandidateRequestModel(
                candidate: Candidate(
          id: (state.candidateDataModel?.id ?? '').toString(),
          userId: state.candidateDataModel?.userId ?? '',
          agentCode: loginModel.uid ?? '',
          firstName: state.firstName.value.toUpperCase(),
          middleName: state.middleName.value.toUpperCase(),
          lastName: state.lastName.value.toUpperCase(),
          position: state.positionId.value.toString(),
          idCardNo: state.identityNo.value,
          maritalStatus: state.martialStatusId.value.toString(),
          placeOfBirth: state.pob.value.toUpperCase(),
          dob: state.dobString.value,
          gender: state.genderId.value.toString(),
          nationality: state.nationality.value.toUpperCase(),
          clientNumber: state.candidateDataModel?.clientNumber ?? '',
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
          occupation: state.occupationId.value.toString(),
          occupationOther: '',
          aajiNo: state.noLicenceAAJI.value,
          aajiActiveFlag: state.checkedValueAAJI,
          aasiNo: state.noLicenceAASI.value,
          aasiActiveFlag: state.checkedValueAASI,
          aauiActiveFlag: state.checkedValueAAJI,
          title: '',
          weight: '',
          high: '',
          religion: state.religionId.value.toString(),
          phoneNo: state.phone.value,
          officePhoneNo: '',
          cellularNo: state.phone.value,
          email: state.phone.value,
          heir: state.heirsName.value,
          heirRelation: state.heirsRelationId.value.toString(),
          jointDate: '',
          aajiExpired: state.candidateDataModel?.aajiExpired ?? '',
          aasiExpired: state.candidateDataModel?.aasiExpired ?? '',
          bankAccount: state.bankNo.value,
          bankName: state.bankNameId.value.toString(),
          bankBranch: state.bankBranch.value,
          bankAccountName: state.bankUserName.value,
          npwpNo: state.npwpNo.value,
          npwpName: '',
          npwpAddress1: '',
          npwpAddress2: '',
          npwpAddress3: '',
          npwpCity: '',
          npwpProvince: '',
          npwpZipCode: '',
          spouseName:
              '${state.candidateDataFamilyModel?.familyDetails?.first.firstName ?? ''} ${state.candidateDataFamilyModel?.familyDetails?.first.middleName ?? ''} ${state.candidateDataFamilyModel?.familyDetails?.first.lastName ?? ''}',
          spouseDob: state
                  .candidateDataFamilyModel?.familyDetails?.first.dateOfBirth ??
              '',
          spouseJob: state.spousePositionId.value.toString(),
          spouseRelation: state.relationId.value.toString(),
          spouseIsAgent: state.spouseIsAgent.value,
          spouseAgentCode: state.agentCode.value,
          spouseUnit: state.directUnitName.value,
          isReinstate: '',
          leaderSignatureDate: '',
          leaderSignatureCity: '',
          signatureDate: '',
          signatureCity: '',
          verificationNumber: '',
          channelId: '',
          channelCode: '',
          officeCode: state.candidateDataModel?.officeCode ?? '',
          officeCity: state.candidateDataModel?.officeCity ?? '',
          taxType: '',
          idCardType: '',
          reinstateOfficeCode: '',
          reinstateLeaderName: '',
          reinstateLastPosition: '',
          reinstateStatus: '',
          reinstateAgentCode: '',
          supervisorAgentCode: '',
          locationCode: '',
          branchCode: '',
          altReferenceNo: '',
          isSubmission: '',
          isCompleted: '',
          isSignature: '',
          dependent: '',
          otherReligion: '',
          sourceInformation: '',
          sourceInformationDesc: '',
          isEqualWithKtp: '',
          ptkpIsExist: '',
          resignLetterDate: '',
          terminationDate: '',
          prevCompany: (state.candidateDataModel?.prevCompany ?? 0).toString(),
          prevCompanyOthers:
              (state.candidateDataModel?.prevCompanyOthers ?? 0).toString(),
          prevCompanyAasi:
              (state.candidateDataModel?.prevCompanyAasi ?? 0).toString(),
          prevCompanyAaui:
              (state.candidateDataModel?.prevCompanyAaui ?? 0).toString(),
          maritalStatusPtkp: '',
        )));
        await result.when(success: (response) async {
          emit(state.copyWith(
              moveTo: Routes.userList,
              message: 'success-add-private-data',
              submitStatus: FormzSubmissionStatus.success));
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

  Future<void> faaAddAgentDocSubmitted(FaaAddAgentDocSubmittedEvent event,
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

      if (state.terminationValueAAJIImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "SURAT TERMINASI",
          name: "SURAT TERMINASI",
          stringBase: state.terminationValueAAJIImage.value,
        ));
      }
      if (state.notTwistingValueAAJIImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "SURAT TIDAK MELAKUKAN TWISTING",
          name: "SURAT TIDAK MELAKUKAN TWISTING",
          stringBase: state.notTwistingValueAAJIImage.value,
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

      if (state.terminationValueAASIImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "SURAT TERMINASI AASI",
          name: "SURAT TERMINASI AASI",
          stringBase: state.terminationValueAASIImage.value,
        ));
      }
      if (state.notTwistingValueAASIImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "SURAT TIDAK MELAKUKAN TWISTING AASI",
          name: "SURAT TIDAK MELAKUKAN TWISTING AASI",
          stringBase: state.notTwistingValueAASIImage.value,
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

      if (state.terminationValueAAUIImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "SURAT TERMINASI AAUI",
          name: "SURAT TERMINASI AAUI",
          stringBase: state.terminationValueAAUIImage.value,
        ));
      }
      if (state.notTwistingValueAAUIImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "SURAT TIDAK MELAKUKAN TWISTING AAUI",
          name: "SURAT TIDAK MELAKUKAN TWISTING AAUI",
          stringBase: state.notTwistingValueAAUIImage.value,
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

      if (state.privateImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "PHOTO",
          name: "PHOTO",
          stringBase: state.privateImage.value,
        ));
      }
      if (state.terminationImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "SURAT RESIGN ATAU TERMINASI",
          name: "SURAT RESIGN ATAU TERMINASI",
          stringBase: state.terminationImage.value,
        ));
      }

      if (state.notTwistingImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: "SURAT TIDAK MELAKUKAN TWISTING",
          name: "SURAT TIDAK MELAKUKAN TWISTING",
          stringBase: state.notTwistingImage.value,
        ));
      }

      if (state.appendixImage.isValid) {
        listDoc.add(RequestCandidateDocModel(
          agentCode: loginModel.uid,
          candidateId: state.candidateRegisterModel?.id.toString(),
          docType: state.appendixValue?.name,
          name: state.appendixValue?.name,
          stringBase: state.appendixImage.value,
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
      statusEmployee: value,
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
                  candidateId: state.candidateDataModel?.id.toString(),
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
  Future<void> educationLevelInput(EducationLevelInputEvent event,
      Emitter<FaaCandidatePageState> emit) async {
    final value = DropdownFieldValidator.dirty(event.value.id ?? 0);
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
      educationDescription: value,
    ));
  }

  Future<void> educationStartInput(EducationStartInputEvent event,
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
      educationStart: value,
      educationStartDate: event.educationStart,
    ));
  }

  Future<void> educationEndInput(
      EducationEndInputEvent event, Emitter<FaaCandidatePageState> emit) async {
    var month = event.educationEnd.month.toString().length == 1
        ? '0${event.educationEnd.month}'
        : event.educationEnd.month;
    var day = event.educationEnd.day.toString().length == 1
        ? '0${event.educationEnd.day}'
        : event.educationEnd.day;
    var dateTime = "${event.educationEnd.year}-$month-$day";
    final value = MandatoryFieldValidator.dirty(dateTime);
    emit(state.copyWith(
      educationEnd: value,
      educationEndDate: event.educationEnd,
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

  Future<void> addEducation(
      AddEducationEvent event, Emitter<FaaCandidatePageState> emit) async {
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

  Future<void> submitEducation(
      SubmitEducationEvent event, Emitter<FaaCandidatePageState> emit) async {
    emit(state.copyWith(
      submitStatus: FormzSubmissionStatus.inProgress,
    ));
    if (state.isValid) {
      try {
        if (state.addCompanyModel == null &&
            state.checkIsEmployee.value == 'tidak') {
          emit(state.copyWith(
            message: 'success-submit-education',
            submitStatus: FormzSubmissionStatus.success,
          ));
        } else {
          final result = await candidateFaaRepository.addCandidateEducation(
              EducationCandidateModel(
                  candidateId: state.candidateDataModel?.id.toString(),
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
