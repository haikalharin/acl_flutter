import 'dart:async';
import 'dart:ffi';

import 'package:acl_flutter/core/local_storage/secure_storage/secure_storage.dart';
import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:acl_flutter/data/model/response_model/response_model.dart';
import 'package:acl_flutter/main.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../../common/secure.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import '../../../core/local_storage/shared_preference/app_shared_preference.dart';
import '../../../core/router/routes.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repository/login/login_repository.dart';

part 'login_page_event.dart';

part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  final LoginRepository loginRepository;

  LoginPageBloc({required this.loginRepository})
      : super(const LoginPageState()) {
    on<UserNameInputEvent>(userNameInput);
    on<PasswordInputEvent>(passwordInput);
    on<LoginSubmittedEvent>(loginSubmitted);
    on<LoginPageInitialEvent>(loginPageInitial);
  }

  Future<void> loginPageInitial(LoginPageInitialEvent event,
      Emitter<LoginPageState> emit) async {
    emit(LoginPageInitial());
  }

  Future<void> userNameInput(UserNameInputEvent event,
      Emitter<LoginPageState> emit) async {
    final userName = MandatoryFieldValidator.dirty(event.userName);
    emit(state.copyWith(
      userName: userName,
    ));
  }

  Future<void> passwordInput(PasswordInputEvent event,
      Emitter<LoginPageState> emit) async {
    final password = MandatoryFieldValidator.dirty(encrypt(event.password));
      emit(state.copyWith(
      password: password,
    ));
  }

  Future<void> loginSubmitted(LoginSubmittedEvent event,
      Emitter<LoginPageState> emit) async {
    final userName = state.userName;
    final password = state.password;
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));

    Future.delayed(const Duration(seconds: 2));
    if (state.isValid) {
      try {
        final result = await loginRepository.login(
            userName: userName.value, password: password.value);
        result.when(success: (response) {
          ResponseModel responseModel = ResponseModel.fromJson(response.data,LoginModel.fromJson);
          SecureStorage().setUser(responseModel.data);
          SecureStorage()
              .setToken(response.headers.map['Authorization']?.first ?? '');
          emit(state.copyWith(
              userName: userName,
              password: password,
              moveTo: Routes.userList,
              submitStatus: FormzSubmissionStatus.success));
        }, failure: (error) {
          emit(state.copyWith(
              submitStatus: FormzSubmissionStatus.failure,
              userName: userName,
              password: password));
        });
      } catch (error) {
        print(error);
      }
    } else{
      emit(state.copyWith(
          submitStatus: FormzSubmissionStatus.failure,
          userName: userName,
          password: password));
    }
  }
}
