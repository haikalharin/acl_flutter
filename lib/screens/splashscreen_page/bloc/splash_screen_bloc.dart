import 'dart:async';

import 'package:acl_flutter/core/local_storage/secure_storage/secure_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/app_constants.dart';
import '../../../core/local_storage/shared_preference/app_shared_preference.dart';
import '../../../data/model/login_model/login_model.dart';
import '../../../utils/date_formatter.dart';

part 'splash_screen_event.dart';

part 'splash_screen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(SplashScreenInitial()) {
    on<SplashscreenCheckUserExist>(_mapSplashScreenCheckUserExistToState);
  }

  Future<void> _mapSplashScreenCheckUserExistToState(
    SplashscreenCheckUserExist event,
    Emitter<SplashscreenState> emit,
  ) async {
    final LoginModel userModel = await SecureStorage().getUser();
    await Future.delayed(const Duration(seconds: 2));
    if (userModel.username != null) {
      emit(state.copyWith(
          userModel: userModel,
          submitStatus: FormzSubmissionStatus.success,
          isExist: true));
    } else {
      emit(state.copyWith(
          submitStatus: FormzSubmissionStatus.success, isExist: false));
    }
  }
}
