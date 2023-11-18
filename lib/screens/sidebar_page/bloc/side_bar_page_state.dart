part of 'side_bar_page_bloc.dart';




class SideBarPageState extends Equatable {
  final FormzSubmissionStatus submitStatus;
  final LoginModel? userModel;
  final String? moveTo;

  const SideBarPageState( {
    this.userModel,
    this.moveTo,
    this.submitStatus = FormzSubmissionStatus.initial,

  });




  @override
  List<Object?> get props => [ userModel,submitStatus];

  SideBarPageState copyWith({
    LoginModel? userModel,
    String? moveTo,
    FormzSubmissionStatus? submitStatus,
  }) {
    return SideBarPageState(
      userModel: userModel ?? this.userModel,
      moveTo: moveTo ?? this.moveTo,
      submitStatus: submitStatus ?? FormzSubmissionStatus.initial,
    );
  }
}

class SideBarPageInitial extends SideBarPageState {}