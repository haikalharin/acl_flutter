import 'dart:async';

import 'package:acl_flutter/data/model/master_data_model/master_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/secure.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import 'package:equatable/equatable.dart';

import '../../../core/router/routes.dart';
import '../../../data/repository/candidate/candidate_repository.dart';


part 'add_candidate_page_event.dart';
part 'add_candidate_page_state.dart';

class AddCandidatePageBloc extends Bloc<AddCandidatePageEvent, AddCandidatePageState> {
  final CandidateRepository candidateRepository;
  AddCandidatePageBloc({required this.candidateRepository}) : super(AddAgentPageInitial()) {
    on<FetchMasterDataEvent>(fetchMasterData);
    on<UserNameInputEvent>(userNameInput);
    on<PasswordInputEvent>(passwordInput);
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


  Future<void> userNameInput(UserNameInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final userName = MandatoryFieldValidator.dirty(event.userName);
    emit(state.copyWith(
      firstName: userName,
    ));
  }

  Future<void> passwordInput(PasswordInputEvent event,
      Emitter<AddCandidatePageState> emit) async {
    final password = MandatoryFieldValidator.dirty(encrypt(event.password));
    emit(state.copyWith(
      middleName: password,
    ));
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

