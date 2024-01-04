import 'dart:async';

import 'package:acl_flutter/core/local_storage/secure_storage/secure_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../data/model/login_model/login_model.dart';

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
      int ts = int.parse(userModel.lastAuthenticated ?? '0');
      DateTime dt = DateTime.fromMillisecondsSinceEpoch(ts);
      DateTime dtNow = DateTime.now();
      Duration diff = dtNow.difference(dt);

      // String date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
      if (diff.inMinutes < 30) {
        emit(state.copyWith(
            userModel: userModel,
            submitStatus: FormzSubmissionStatus.success,
            isExist: true));
      } else {
        emit(state.copyWith(
            submitStatus: FormzSubmissionStatus.success, isExist: false));
      }
    } else {
      emit(state.copyWith(
          submitStatus: FormzSubmissionStatus.success, isExist: false));
    }
  }
}
