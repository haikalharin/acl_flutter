

part of 'login_page_bloc.dart';

class LoginPageState extends Equatable with FormzMixin {
  final FormzSubmissionStatus submitStatus;
  final UserNameValidator userName;
  final MandatoryFieldValidator password;
  final String? moveTo;

  const LoginPageState( {
    this.userName = const UserNameValidator.pure(),
    this.password = const MandatoryFieldValidator.pure(),
    this.moveTo,
    this.submitStatus = FormzSubmissionStatus.initial,

  });

  @override
  List<Object?> get props => [userName, password,submitStatus];
  @override
  List<FormzInput> get inputs => [userName, password];


  LoginPageState copyWith({
    UserNameValidator? userName,
    MandatoryFieldValidator? password,
    String? moveTo,
    FormzSubmissionStatus? submitStatus,
  }) {
    return LoginPageState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      moveTo: moveTo ?? this.moveTo,
      submitStatus: submitStatus??FormzSubmissionStatus.initial,
    );
  }


}



class LoginPageInitial extends LoginPageState {}