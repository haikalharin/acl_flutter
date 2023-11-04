

part of 'login_page_bloc.dart';

enum LoginPageStatus { initial, success, error, loading, selected }

extension LoginPageStatusX on LoginPageStatus {
  bool get isInitial => this == LoginPageStatus.initial;
  bool get isSuccess => this == LoginPageStatus.success;
  bool get isError => this == LoginPageStatus.error;
  bool get isLoading => this == LoginPageStatus.loading;
  bool get isSelected => this == LoginPageStatus.selected;
}

class LoginPageState extends Equatable {
  final LoginPageStatus status;
  final String? username;
  final String? password;
  final String? moveTo;

  const LoginPageState( {
    this.username,
    this.moveTo,
    this.password,
    this.status = LoginPageStatus.initial,

  });




  @override
  List<Object?> get props => [ username,password,status];

  LoginPageState copyWith({
    String? username,
    String? password,
    String? moveTo,
    LoginPageStatus? status,
  }) {
    return LoginPageState(
      username: username ?? this.username,
      password: password ?? this.password,
      moveTo: moveTo ?? this.moveTo,
      status: status ?? LoginPageStatus.initial,
    );
  }
}

class LoginPageInitial extends LoginPageState {}