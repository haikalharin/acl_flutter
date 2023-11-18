import 'dart:async';

import 'package:acl_flutter/core/local_storage/secure_storage/secure_storage.dart';
import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'side_bar_page_event.dart';

part 'side_bar_page_state.dart';

class SideBarPageBloc extends Bloc<SideBarPageEvent, SideBarPageState> {
  SideBarPageBloc() : super(SideBarPageState()) {
    on<GetUserInfoEvent>(getUserInfo);
  }

  Future<void> getUserInfo(
      SideBarPageEvent event, Emitter<SideBarPageState> emit) async {
    LoginModel userModel = await SecureStorage().getUser();
    emit(state.copyWith(
      userModel: userModel,
      submitStatus: FormzSubmissionStatus.success,
    ));
  }
}
