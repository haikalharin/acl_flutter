import 'package:acl_flutter/data/model/user/user.dart';

abstract class UserEvent {}

class UsersFetched extends UserEvent {
  final Gender? gender;
  final UserStatus? status;

  UsersFetched({this.gender, this.status});
}

class UserCreated extends UserEvent {
  final User user;

  UserCreated(this.user);
}

class UserUpdated extends UserEvent {
  final User user;

  UserUpdated(this.user);
}

class UserDeleted extends UserEvent {
  final User user;

  UserDeleted(this.user);
}
