import 'dart:async';

import 'package:acl_flutter/data/model/candidate/request_candidate_doc_model.dart';
import 'package:acl_flutter/data/model/master_data_model/master_data_model.dart';
import 'package:acl_flutter/data/model/sepouse/request_sepouse_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/validators/identity_no_validator.dart';
import '../../../common/validators/mandatory_dropdown_validator.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import 'package:equatable/equatable.dart';

import '../../../common/validators/zipcode_validator.dart';
import '../../../core/local_storage/secure_storage/secure_storage.dart';
import '../../../core/router/routes.dart';
import '../../../data/model/candidate/candidate_model.dart';
import '../../../data/model/candidate/candidate_register_model.dart';
import '../../../data/model/candidate/request_candidate_model.dart';
import '../../../data/model/login_model/login_model.dart';
import '../../../data/repository/candidate/candidate_repository.dart';

part 'add_candidate_page_event.dart';

part 'add_candidate_page_state.dart';

class AddCandidatePageBloc
    extends Bloc<AddCandidatePageEvent, AddCandidatePageState> {
  final CandidateRepository candidateRepository;

  AddCandidatePageBloc({required this.candidateRepository})
      : super(AddAgentPageInitial()) {
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
    on<AddCandidatePageInitialEvent>(addAgentPageInitial);
  }

  Future<void> addAgentPageInitial(AddCandidatePageInitialEvent event,
      Emitter<AddCandidatePageState> emit) async {
    emit(AddAgentPageInitial());
  }

  Future<void> fetchMasterData(FetchMasterDataEvent event,
      Emitter<AddCandidatePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    try {
      final result = await candidateRepository.fetchMasterData();
      result.when(success: (response) {
        emit(state.copyWith(
            masterDataModel: response.data,
            moveTo: Routes.addAgentPage,
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

  Future<void> firstNameInput(FirstNameInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final firstName = MandatoryFieldValidator.dirty(event.firstName);
    emit(state.copyWith(
      firstName: firstName,
    ));
  }

  Future<void> middleNameInput(MiddleNameInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final middleName = MandatoryFieldValidator.dirty(event.middleName);
    emit(state.copyWith(
      middleName: middleName,
    ));
  }

  Future<void> lastNameInput(LastNameInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final lastName = MandatoryFieldValidator.dirty(event.lastName);
    emit(state.copyWith(
      lastName: lastName,
    ));
  }

  Future<void> dobInput(DobInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final dob = MandatoryFieldValidator.dirty(event.dob);
    emit(state.copyWith(
      dob: dob,
    ));
  }

  Future<void> identityNoInput(IdentityNoInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final identityNo = IdentityNoValidator.dirty(event.identityNo);
    emit(state.copyWith(
      identityNo: identityNo,
    ));
  }

  Future<void> identityImageInput(IdentityImageInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final identityImage = MandatoryFieldValidator.dirty(event.identityImage);
    emit(state.copyWith(
      identityImage: identityImage,
    ));
  }

  Future<void> identitySelfieImageInput(IdentitySelfieImageInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final identitySelfieImage =
    MandatoryFieldValidator.dirty(event.identitySelfieImage);
    emit(state.copyWith(
      identitySelfieImage: identitySelfieImage,
    ));
  }

  Future<void> kkNoInput(KkNoInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final kkNo = IdentityNoValidator.dirty(event.kkNo);
    emit(state.copyWith(
      kkNo: kkNo,
    ));
  }

  Future<void> kkImageInput(KkImageInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final kkImage = MandatoryFieldValidator.dirty(event.kkImage);
    emit(state.copyWith(
      kkImage: kkImage,
    ));
  }

  Future<void> addressInput(AddressInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final address = MandatoryFieldValidator.dirty(event.address);
    emit(state.copyWith(
      address: address,
    ));
  }

  Future<void> rtRwInput(RtRwInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final rtRw = MandatoryFieldValidator.dirty(event.rtRw);
    emit(state.copyWith(
      rtRw: rtRw,
    ));
  }

  Future<void> kecKelInput(KecKelInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final kecKel = MandatoryFieldValidator.dirty(event.kecKel);
    emit(state.copyWith(
      kecKel: kecKel,
    ));
  }

  Future<void> postalCodeInput(PostalCodeInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final postalCode = ZipcodeValidator.dirty(event.postalCode);
    emit(state.copyWith(
      postalCode: postalCode,
    ));
  }

  Future<void> countryInput(CountryInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
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

  Future<void> provinceInput(ProvinceInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
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

  Future<void> cityInput(CityInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
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

  Future<void> occupationInput(OccupationInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
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

  Future<void> noLicenceAAJIInput(AajiNoInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final noLicenceAAJI = MandatoryFieldValidator.dirty(event.aajiNo);
    emit(state.copyWith(
      noLicenceAAJI: noLicenceAAJI,
    ));
  }

  Future<void> imageLicenceAAJIInput(AajiImageInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final imageLicenceAAJI = MandatoryFieldValidator.dirty(event.aajiImage);
    emit(state.copyWith(
      imageLicenceAAJI: imageLicenceAAJI,
    ));
  }

  Future<void> noLicenceAASIInput(AasiNoInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final noLicenceAASI = MandatoryFieldValidator.dirty(event.aasiNo);
    emit(state.copyWith(
      noLicenceAASI: noLicenceAASI,
    ));
  }

  Future<void> imageLicenceAASIInput(AasiImageInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final imageLicenceAASI = MandatoryFieldValidator.dirty(event.aasiImage);
    emit(state.copyWith(
      imageLicenceAASI: imageLicenceAASI,
    ));
  }

  Future<void> noLicenceAAUIInput(AauiNoInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final noLicenceAAUI = MandatoryFieldValidator.dirty(event.aauiNo);
    emit(state.copyWith(
      noLicenceAAUI: noLicenceAAUI,
    ));
  }

  Future<void> imageLicenceAAUIInput(AauiImageInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final imageLicenceAAUI = MandatoryFieldValidator.dirty(event.aauiImage);
    emit(state.copyWith(
      imageLicenceAAUI: imageLicenceAAUI,
    ));
  }

  Future<void> firstNamePartnerInput(FirstNamePartnerInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final firstNamePartner =
    MandatoryFieldValidator.dirty(event.firstNamePartner);
    emit(state.copyWith(
      firstNamePartner: firstNamePartner,
    ));
  }

  Future<void> middleNamePartnerInput(MiddleNamePartnerInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final middleNamePartner =
    MandatoryFieldValidator.dirty(event.middleNamePartner);
    emit(state.copyWith(
      middleNamePartner: middleNamePartner,
    ));
  }

  Future<void> lastNamePartnerInput(LastNamePartnerInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final lastNamePartner =
    MandatoryFieldValidator.dirty(event.lastNamePartner);
    emit(state.copyWith(
      lastName: lastNamePartner,
    ));
  }

  Future<void> dobPartnerInput(DobPartnerInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final dobPartner = MandatoryFieldValidator.dirty(event.dobPartner);
    emit(state.copyWith(
      dobPartner: dobPartner,
    ));
  }

  Future<void> partnerIdentityNoInput(PartnerIdentityNoInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final identityNoPartner =
    IdentityNoValidator.dirty(event.partnerIdentityNo);
    emit(state.copyWith(
      identityNoPartner: identityNoPartner,
    ));
  }

  Future<void> genderPartnerInput(GenderPartnerInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
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
      Emitter<AddCandidatePageState> emit) async {
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

  Future<void> aajiCheckedInput(AajiCheckedInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueAAJI: event.aajiChecked,
    ));
  }

  Future<void> aasiCheckedInput(AasiCheckedInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueAASI: event.aasiChecked,
    ));
  }

  Future<void> aauiCheckedInput(AauiCheckedInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueAAUI: event.aauiChecked,
    ));
  }

  Future<void> marriedCheckedInputEvent(MarriedCheckedInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    emit(state.copyWith(
      checkedValueMarriage: event.marriedChecked,
    ));
  }

  Future<void> addAgentSubmitted(AddAgentSubmittedEvent event,
      Emitter<AddCandidatePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    if (state.isValid) {
      try {
        LoginModel loginModel = await SecureStorage().getUser();
        final result = await candidateRepository
            .addRegisterCandidate(RequestCandidateModel(
          firstName: state.firstName.value,
          middleName: state.middleName.value,
          lastName: state.lastName.value,
          dob: state.dob.value,
          address1: state.address.value,
          address2: state.rtRw.value,
          address3: state.kecKel.value,
          city: state.cityId.value.toString(),
          province: state.provinceId.value.toString(),
          zipCode: state.postalCode.value.toString(),
          country: state.countryId.value.toString(),
          leaderName: loginModel.name ?? '',
          leaderAgentCode: loginModel.uid ?? '',
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
                firstName: state.firstNamePartner.value,
                gender: state.gender?.longDescriptionEng??'',
                relation: state.relationId.value.toString(),
                dateOfBirth: state.dobPartner.value)
          ];
          if (state.checkedValueMarriage) {
            final result = await candidateRepository.addRegisterSepouse(
                RequestSepouseModel(
                    candidateId: responseData.id.toString(),
                    familyCardNo: state.kkNo.value,
                    familyDetails: listFamiliDetail));
            await result.when(success: (response) async {
              final result = await candidateRepository.addFolderDoc(responseData.id.toString());
              await   result.when(success: (response)async  {
                emit(state.copyWith(
                    moveTo: Routes.userList,
                    candidateRegisterModel: responseData,
                    message: 'create-register',
                    submitStatus: FormzSubmissionStatus.success));
              }, failure: (error)async {
                emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
              });
            }, failure: (error)async {
              emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
            });
          } else {
            final result = await candidateRepository.addFolderDoc(responseData.id.toString());
            await result.when(success: (response) async {
              emit(state.copyWith(
                  moveTo: Routes.userList,
                  candidateRegisterModel: responseData,
                  message: 'create-register',
                  submitStatus: FormzSubmissionStatus.success));
            }, failure: (error) async {
              emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
            });
          }
        }, failure: (error) async{
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
      Emitter<AddCandidatePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    if (state.isValid) {
      try {
        await _sendDoc().then((value) {
          if(value == 0){
            emit(state.copyWith(
                moveTo: Routes.userList,
                message: 'send-doc',
                submitStatus: FormzSubmissionStatus.success));
          } else{
            emit(state.copyWith(
                submitStatus: FormzSubmissionStatus.failure));
          }
        });
      } catch (error) {
        emit(state.copyWith(
            submitStatus: FormzSubmissionStatus.failure));
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
      int failureTotal =0;
      for (var element in listDoc) {
        final result =
        await candidateRepository.addRegisterCandidateDoc(element);
        await result.when(
            success: (response) async {},
            failure: (error) {
              failureTotal ++;
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
