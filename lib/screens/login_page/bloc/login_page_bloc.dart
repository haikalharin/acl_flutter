import 'dart:async';
import 'dart:ffi';

import 'package:acl_flutter/main.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../../common/secure.dart';
import '../../../core/router/routes.dart';
import 'package:equatable/equatable.dart';
import '../../../repository/login/login_repository.dart';

part 'login_page_event.dart';

part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  final LoginRepository loginRepository;

  LoginPageBloc({required this.loginRepository}) : super(const LoginPageState()) {
      on<UserNameInputEvent>(userNameInput);
      on<PasswordInputEvent>(passwordInput);
      on<LoginSubmittedEvent>(loginSubmitted);
      on<LoginPageInitialEvent>(loginPageInitial);

  }

  Future<void> loginPageInitial(
      LoginPageInitialEvent event, Emitter<LoginPageState> emit) async {
    emit( LoginPageInitial());
  }

  Future<void> userNameInput(
      UserNameInputEvent event, Emitter<LoginPageState> emit) async {
    emit(state.copyWith(
      username: event.userName,
    ));
  }

  Future<void> passwordInput(
      PasswordInputEvent event, Emitter<LoginPageState> emit) async {
    emit(state.copyWith(
      password: encrypt(event.password),
    ));
  }

  Future<void> loginSubmitted(
      LoginSubmittedEvent event, Emitter<LoginPageState> emit) async {
    final userName = state.username;
    final password = state.password;
    emit(state.copyWith (status: LoginPageStatus.loading));

    Future.delayed(const Duration(seconds: 2));
    try{
      final result =
      await loginRepository.login(userName: userName, password: password);
      result.when(success: (data) {
        emit(state.copyWith(
            username: userName,
            password: password,
            moveTo: Routes.userList,
            status: LoginPageStatus.success));
      }, failure: (error) {

        emit(state.copyWith(status: LoginPageStatus.error,username: userName,password: password));
      });
    }catch(error){
      print(error);
    }}

}
