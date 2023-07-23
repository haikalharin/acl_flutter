import 'package:base_mvvm/common/bloc/bloc_helper.dart';
import 'package:base_mvvm/common/bloc/generic_bloc_state.dart';
import 'package:base_mvvm/data/model/user/user.dart';
import 'package:base_mvvm/repository/user/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_event.dart';

typedef Emit = Emitter<GenericBlocState<User>>;

class UserBloc extends Bloc<UserEvent, GenericBlocState<User>>
    with BlocHelper<User> {
  UserBloc({required this.userRepository}) : super(GenericBlocState.loading()) {
    on<UsersFetched>(getUserList);
    on<UserCreated>(createUser);
    on<UserUpdated>(updateUser);
    on<UserDeleted>(deleteUser);
  }

  final UserRepository userRepository;

  Future<void> getUserList(UsersFetched event, Emit emit) async {
    await getItems(
        userRepository.getUsers(gender: event.gender, status: event.status),
        emit);
  }

  Future<void> createUser(UserCreated event, Emit emit) async {
    await createItem(userRepository.createUser(event.user), emit);
  }

  Future<void> updateUser(UserUpdated event, Emit emit) async {
    await updateItem(userRepository.updateUser(event.user), emit);
  }

  Future<void> deleteUser(UserDeleted event, Emit emit) async {
    await deleteItem(userRepository.deleteUser(event.user), emit);
  }
}
