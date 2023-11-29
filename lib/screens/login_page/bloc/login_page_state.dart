

part of 'login_page_bloc.dart';

class LoginPageState extends Equatable with FormzMixin {
  final FormzSubmissionStatus submitStatus;
  final MandatoryFieldValidator userName;
  final MandatoryFieldValidator password;
  final String? moveTo;

  const LoginPageState( {
    this.userName = const MandatoryFieldValidator.pure(),
    this.password = const MandatoryFieldValidator.pure(),
    this.moveTo,
    this.submitStatus = FormzSubmissionStatus.initial,

  });

  @override
  List<Object?> get props => [userName, password,submitStatus];
  @override
  List<FormzInput> get inputs => [userName, password];


  LoginPageState copyWith({
    MandatoryFieldValidator? userName,
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