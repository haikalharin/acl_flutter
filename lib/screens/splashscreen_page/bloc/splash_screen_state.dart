part of 'splash_screen_bloc.dart';

class SplashscreenState {
  final String? role;
  final bool isExist;
  final FormzSubmissionStatus submitStatus;
  final String? errorMessage;
  final LoginModel? userModel;

  SplashscreenState(
      {
      this.role,
        this.isExist = false,
        this.submitStatus = FormzSubmissionStatus.initial,
        this.userModel,
        this.errorMessage});

  SplashscreenState copyWith(
      {FormzSubmissionStatus? submitStatus,
        bool? isExist,
        String? role,
        LoginModel? userModel,
        String? errorMessage}) {
    return SplashscreenState(
        submitStatus: submitStatus ?? this.submitStatus,
        isExist: isExist ?? this.isExist,
        role: role ?? this.role,
        userModel: userModel ?? this.userModel,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [submitStatus];
}

class  SplashScreenInitial extends SplashscreenState {}