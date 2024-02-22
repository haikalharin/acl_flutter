import 'dart:async';

import 'package:acl_flutter/core/local_storage/secure_storage/secure_storage.dart';
import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';
import 'package:acl_flutter/data/repository/agent/agent_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';

import '../../../common/secure.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import '../../../common/validators/username_validator.dart';
import '../../../core/router/routes.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/agent_model/profile_agent_model.dart';
import '../../../data/repository/login/login_repository.dart';

part 'login_page_event.dart';

part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  final LoginRepository loginRepository;
  final AgentRepository agentRepository;

  LoginPageBloc({required this.loginRepository, required this.agentRepository})
      : super(const LoginPageState()) {
    on<UserNameInputEvent>(userNameInput);
    on<PasswordInputEvent>(passwordInput);
    on<LoginSubmittedEvent>(loginSubmitted);
    on<LoginPageInitialEvent>(loginPageInitial);
  }

  Future<void> loginPageInitial(
      LoginPageInitialEvent event, Emitter<LoginPageState> emit) async {
    emit(LoginPageInitial());
  }

  Future<void> userNameInput(
      UserNameInputEvent event, Emitter<LoginPageState> emit) async {
    final userName = UserNameValidator.dirty(event.userName);
    emit(state.copyWith(
      userName: userName,
    ));
  }

  Future<void> passwordInput(
      PasswordInputEvent event, Emitter<LoginPageState> emit) async {
    final password = MandatoryFieldValidator.dirty(encrypt(event.password));
    emit(state.copyWith(
      password: password,
    ));
  }

  Future<void> loginSubmitted(
      LoginSubmittedEvent event, Emitter<LoginPageState> emit) async {
    final userName = state.userName;
    final password = state.password;
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));

    Future.delayed(const Duration(seconds: 2));
    if (state.isValid) {
      try {
        final result = await loginRepository.login(
            userName: userName.value, password: password.value);
        await result.when(success: (response) async {
          ResponseModel responseModel =
              ResponseModel.fromJson(response.data, LoginModel.fromJson);
          await SecureStorage().setUser(responseModel.data);
          await SecureStorage()
              .setToken(response.headers.map['Authorization']?.first ?? '');
          final result = await agentRepository.getDataAgent(
              leaderCode: responseModel.data.uid ?? '');
          await result.when(
              success: (response) async {
                await SecureStorage().setDataAgent(response.data);
                emit(state.copyWith(
                    message: 'success-login',
                    userName: userName,
                    password: password,
                    moveTo: Routes.userList,
                    submitStatus: FormzSubmissionStatus.success));
              },
              failure: (error) {
                emit(state.copyWith(
                    message: 'success-login',
                    userName: userName,
                    password: password,
                    moveTo: Routes.userList,
                    submitStatus: FormzSubmissionStatus.success));
              });
        }, failure: (error) {
          emit(state.copyWith(
              submitStatus: FormzSubmissionStatus.failure,
              userName: userName,
              password: password));
        });
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } else {
      emit(state.copyWith(
          submitStatus: FormzSubmissionStatus.failure,
          userName: userName,
          password: password));
    }
  }
}
