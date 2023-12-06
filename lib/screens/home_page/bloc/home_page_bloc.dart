import 'dart:async';

import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:acl_flutter/data/model/notification_model/notification_model.dart';
import 'package:acl_flutter/data/repository/candidate/candidate_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../core/local_storage/secure_storage/secure_storage.dart';
import '../../../core/router/routes.dart';
import '../../../data/model/candidate/candidate_be_model.dart';
import '../../../data/model/candidate/candidate_model.dart';
import '../../../data/repository/notification/notification_repository.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final CandidateRepository agentRepository;
  final NotificationRepository notificationRepository;

  HomePageBloc({required this.agentRepository,required this.notificationRepository}) : super(const HomePageState()) {
    on<FetchListMyAgentEvent>(fetchListAgent);
    on<FetchListBeAgentEvent>(fetchListBeAgent);
    on<FetchListNotifyEvent>(fetchListNotify);
    on<HomePageInitialEvent>(homePageInitial);
  }

  Future<void> homePageInitial(
      HomePageInitialEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    try {
      LoginModel loginModel = await SecureStorage().getUser();
      if(loginModel.uid!.isNotEmpty){
        emit(state.copyWith(
            loginModel: loginModel,
        ));
      }
    } catch (error) {
      print(error);
    }
  }



  Future<void> fetchListAgent(
      FetchListMyAgentEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    try {
      LoginModel loginModel = await SecureStorage().getUser();
      final result = await agentRepository.fetchListMyAgent(
          leaderCode: loginModel.uid ?? '');
      result.when(success: (response) {
        List<CandidateModel> listAgent = response.data;
        if(event.filter == 1){
         listAgent.sort((a, b) => (a.firstName??'').compareTo(b.firstName??''));
        }else if(event.filter == 2){
          listAgent.sort((a, b) => (b.firstName??'').compareTo(a.firstName??''));
        }else if(event.filter == 3){
          listAgent.sort((a, b) => (b.createDate??'').compareTo(a.createDate??''));
        }else if(event.filter == 4){
          listAgent.sort((a, b) => (b.submissionDate??'').compareTo(a.submissionDate??''));
        }
        emit(state.copyWith(
            listAgentModel: listAgent,
            moveTo: Routes.homePage,
            submitStatus: FormzSubmissionStatus.success));
      }, failure: (error) {
        emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure, errorMessage: error));
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> fetchListBeAgent(
      FetchListBeAgentEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    try {
      LoginModel loginModel = await SecureStorage().getUser();
      final result = await agentRepository.fetchListBeAgent(
          leaderCode: loginModel.uid ?? '');
      result.when(success: (response) {
        List<CandidateBeModel> listAgent = response.data;
        if(event.filter == 1){
          listAgent.sort((a, b) => (a.firstName??'').compareTo(b.firstName??''));
        }else if(event.filter == 2){
          listAgent.sort((a, b) => (b.firstName??'').compareTo(a.firstName??''));
        } else if(event.filter == 3){
          listAgent.sort((a, b) => (a.startDate??'').compareTo(b.startDate??''));
        }else if(event.filter == 4){
          listAgent.sort((a, b) => (a.reviewDate??'').compareTo(b.reviewDate??''));
        }
        emit(state.copyWith(
            listAgentBeModel: listAgent,
            submitStatus: FormzSubmissionStatus.success));
      }, failure: (error) {
        emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure, errorMessage: error));
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> fetchListNotify(
      FetchListNotifyEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    try {
      LoginModel loginModel = await SecureStorage().getUser();
      final result = await notificationRepository.fetchListNotify(
          leaderCode: loginModel.uid ?? '');
      result.when(success: (response) {
        List<NotificationModel> listNotify = response.data;
        emit(state.copyWith(
            listNotify: listNotify,
            submitStatus: FormzSubmissionStatus.success));
      }, failure: (error) {
        emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure, errorMessage: error));
      });
    } catch (error) {
      print(error);
    }
  }
}
