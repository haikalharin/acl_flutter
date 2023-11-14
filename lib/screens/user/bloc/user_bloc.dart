import 'dart:async';

import 'package:acl_flutter/screens/user/bloc/user_event.dart';
import 'package:acl_flutter/screens/user/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/user/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(const UserState.loaded()) {
    on<UserCreated>(createUser);
  }


  Future<void> createUser(UserCreated event, Emitter<UserState> emit) async {
    emit(UserState.loading(
      data: state.data,
      status: state.status,
      gender: state.gender,
    ));
    final result = await userRepository.createUser(event.user);
    result.when(
        success: (data) {
          add(UsersFetched());
        },
        failure: (error) {});
  }
}
