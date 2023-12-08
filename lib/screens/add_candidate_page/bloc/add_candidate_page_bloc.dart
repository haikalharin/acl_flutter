import 'dart:async';
import 'dart:ffi';

import 'package:acl_flutter/data/model/master_data_model/master_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/secure.dart';
import '../../../common/validators/mandatory_dropdown_validator.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import 'package:equatable/equatable.dart';

import '../../../core/local_storage/secure_storage/secure_storage.dart';
import '../../../core/router/routes.dart';
import '../../../data/model/login_model/login_model.dart';
import '../../../data/repository/candidate/candidate_repository.dart';


part 'add_candidate_page_event.dart';
part 'add_candidate_page_state.dart';

class AddCandidatePageBloc extends Bloc<AddCandidatePageEvent, AddCandidatePageState> {
  final CandidateRepository candidateRepository;
  AddCandidatePageBloc({required this.candidateRepository}) : super(AddAgentPageInitial()) {
    on<FetchMasterDataEvent>(fetchMasterData);
    on<FirstNameInputEvent>(userNameInput);
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
            moveTo: Routes.addAgentPage ,
            submitStatus: FormzSubmissionStatus.success));
      }, failure: (error) {
        emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure));
      });
    } catch (error) {
      print(error);
    }
  }


  Future<void> userNameInput(FirstNameInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final firstName = MandatoryFieldValidator.dirty(event.firstName);
    emit(state.copyWith(
      firstName: firstName,
    ));
  }

  Future<void> provinceInput(ProvinceInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    if(event.isClear){
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

  Future<void> addAgentSubmitted(AddAgentSubmittedEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final userName = state.firstName;
    final password = state.middleName;
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));

    Future.delayed(const Duration(seconds: 2));
    if (state.isValid) {
      // try {
      //   final result = await addAgentRepository.AddAgent(
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

