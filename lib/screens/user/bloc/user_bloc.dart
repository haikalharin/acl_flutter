import 'dart:async';

import 'package:acl_flutter/repository/user/user_repository.dart';
import 'package:acl_flutter/screens/user/bloc/user_event.dart';
import 'package:acl_flutter/screens/user/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(const UserState.loaded()) {
    on<UsersFetched>(getUserList);
    on<UserCreated>(createUser);
  }

  Future<void> getUserList(UsersFetched event, Emitter<UserState> emit) async {
    emit(UserState.loading(
      data: state.data,
      status: state.status,
      gender: state.gender,
    ));
    final status = event.status ?? state.status;
    final gender = event.gender ?? state.gender;
    final result = await userRepository.getUsers(status: status, gender: gender);
    result.when(
        success: (data) {
          final state = UserState.loaded(
            data: data,
            status: status,
            gender: gender,
          );

          emit(state);
        },
        failure: (error) {
          emit(const UserState.empty());
        });
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
