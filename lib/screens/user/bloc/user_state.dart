import 'package:acl_flutter/data/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.empty({List<User>? data, Gender? gender, UserStatus? status, String? error}) = _Empty;

  const factory UserState.loading({List<User>? data, Gender? gender, UserStatus? status, String? error}) = _Loading;

  const factory UserState.loaded({List<User>? data, Gender? gender, UserStatus? status, String? error}) = _Loaded;

  const factory UserState.failure(List<User>? data, Gender? gender, UserStatus? status, String? error) = _Failure;
}
