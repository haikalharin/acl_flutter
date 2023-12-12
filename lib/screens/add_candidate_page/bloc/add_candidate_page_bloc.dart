import 'dart:async';

import 'package:acl_flutter/data/model/master_data_model/master_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/validators/mandatory_dropdown_validator.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import 'package:equatable/equatable.dart';

import '../../../core/router/routes.dart';
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
    on<ProvinceInputEvent>(provinceInput);
    on<AddAgentSubmittedEvent>(addAgentSubmitted);
    on<AddCandidatePageInitialEvent>(addAgentPageInitial);
  }

  Future<void> addAgentPageInitial(AddCandidatePageInitialEvent event,
      Emitter<AddCandidatePageState> emit) async {
    emit(AddAgentPageInitial());
  }

  Future<void> fetchMasterData(
      FetchMasterDataEvent event, Emitter<AddCandidatePageState> emit) async {
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
      print(error);
    }
  }

  Future<void> firstNameInput(
      FirstNameInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final firstName = MandatoryFieldValidator.dirty(event.firstName);
    emit(state.copyWith(
      firstName: firstName,
    ));
  }

  Future<void> middleNameInput(
      MiddleNameInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final middleName = MandatoryFieldValidator.dirty(event.middleName);
    emit(state.copyWith(
      middleName: middleName,
    ));
  }

  Future<void> lastNameInput(
      LastNameInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final lastName = MandatoryFieldValidator.dirty(event.lastName);
    emit(state.copyWith(
      lastName: lastName,
    ));
  }

  Future<void> dobInput(
      DobInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final dob = MandatoryFieldValidator.dirty(event.dob);
    emit(state.copyWith(
      dob: dob,
    ));
  }

  Future<void> identityNoInput(
      IdentityNoInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final identityNo = MandatoryFieldValidator.dirty(event.identityNo);
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

  Future<void> kkNoInput(
      KkNoInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final kkNo = MandatoryFieldValidator.dirty(event.kkNo);
    emit(state.copyWith(
      kkNo: kkNo,
    ));
  }

  Future<void> kkImageInput(
      KkImageInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final kkImage = MandatoryFieldValidator.dirty(event.kkImage);
    emit(state.copyWith(
      kkImage: kkImage,
    ));
  }

  Future<void> addressInput(
      AddressInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final address = MandatoryFieldValidator.dirty(event.address);
    emit(state.copyWith(
      address: address,
    ));
  }

  Future<void> rtRwInput(
      RtRwInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final rtRw = MandatoryFieldValidator.dirty(event.rtRw);
    emit(state.copyWith(
      rtRw: rtRw,
    ));
  }

  Future<void> kecKelInput(
      KecKelInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final kecKel = MandatoryFieldValidator.dirty(event.kecKel);
    emit(state.copyWith(
      kecKel: kecKel,
    ));
  }

  Future<void> postalCodeInput(
      PostalCodeInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final postalCode = MandatoryFieldValidator.dirty(event.postalCode);
    emit(state.copyWith(
      postalCode: postalCode,
    ));
  }

  Future<void> countryInput(
      CountryInputEvent event, Emitter<AddCandidatePageState> emit) async {
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
      ProvinceInputEvent event, Emitter<AddCandidatePageState> emit) async {
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
      CityInputEvent event, Emitter<AddCandidatePageState> emit) async {
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
      OccupationInputEvent event, Emitter<AddCandidatePageState> emit) async {
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
      AajiNoInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final noLicenceAAJI = MandatoryFieldValidator.dirty(event.aajiNo);
    emit(state.copyWith(
      noLicenceAAJI: noLicenceAAJI,
    ));
  }

  Future<void> imageLicenceAAJIInput(
      AajiImageInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final imageLicenceAAJI = MandatoryFieldValidator.dirty(event.aajiImage);
    emit(state.copyWith(
      imageLicenceAAJI: imageLicenceAAJI,
    ));
  }

  Future<void> noLicenceAASIInput(
      AasiNoInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final noLicenceAASI = MandatoryFieldValidator.dirty(event.aasiNo);
    emit(state.copyWith(
      noLicenceAASI: noLicenceAASI,
    ));
  }

  Future<void> imageLicenceAASIInput(
      AasiImageInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final imageLicenceAASI = MandatoryFieldValidator.dirty(event.aasiImage);
    emit(state.copyWith(
      imageLicenceAASI: imageLicenceAASI,
    ));
  }

  Future<void> noLicenceAAUIInput(
      AauiNoInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final noLicenceAAUI = MandatoryFieldValidator.dirty(event.aauiNo);
    emit(state.copyWith(
      noLicenceAAUI: noLicenceAAUI,
    ));
  }

  Future<void> imageLicenceAAUIInput(
      AauiImageInputEvent event, Emitter<AddCandidatePageState> emit) async {
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

  Future<void> dobPartnerInput(
      DobPartnerInputEvent event, Emitter<AddCandidatePageState> emit) async {
    final dobPartner = MandatoryFieldValidator.dirty(event.dobPartner);
    emit(state.copyWith(
      dobPartner: dobPartner,
    ));
  }

  Future<void> partnerIdentityNoInput(PartnerIdentityNoInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final identityNoPartner =
        MandatoryFieldValidator.dirty(event.partnerIdentityNo);
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

  Future<void> addAgentSubmitted(
      AddAgentSubmittedEvent event, Emitter<AddCandidatePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));

    Future.delayed(const Duration(seconds: 2));
    if (state.isValid) {
      // try {
      //   final result = await candidateRepository.(
      //       userName: userName.value, password: password.value);
      //   result.when(success: (response) {
      //     SecureStorage().setUser(AddAgentModel.fromJson(response.data));
      //     SecureStorage()
      //         .setToken(response.headers.map['Authorization']?.first ?? '');
      //     emit(state.copyWith(
      //         userName: userName,
      //         password: password,
      //         moveTo: Routes.userList,
      //         submitStatus: FormzSubmissionStatus.success));
      //   }, failure: (error) {
      //     emit(state.copyWith(
      //         submitStatus: FormzSubmissionStatus.failure,
      //         userName: userName,
      //         password: password));
      //   });
      // } catch (error) {
      //   print(error);
      // }
    }
  }
}
