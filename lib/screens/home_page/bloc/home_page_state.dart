part of 'home_page_bloc.dart';

class HomePageState  {
  final FormzSubmissionStatus submitStatus;
  final List<CandidateModel>? listAgentModel;
  final List<CandidateBeModel>? listAgentBeModel;
  final List<NotificationModel>? listNotify;
  final LoginModel? loginModel;
  final ProfileAgentModel? profileAgentModel;
  final CandidateModel? agentModel;
  final String? errorMessage;
  final String? message;
  final String? loadingMessage;
  final String? moveTo;

  const HomePageState( {
    this.listAgentModel = const [],
    this.listAgentBeModel= const [],
    this.listNotify,
    this.agentModel,
    this.profileAgentModel,
    this.loginModel,
    this.moveTo,
    this.errorMessage,
    this.loadingMessage,
    this.message,
    this.submitStatus = FormzSubmissionStatus.initial,
  });


  HomePageState copyWith({
    CandidateModel? agentModel,
    LoginModel? loginModel,
    ProfileAgentModel? profileAgentModel,
    List<CandidateModel>? listAgentModel,
    List<CandidateBeModel>? listAgentBeModel,
    List<NotificationModel>? listNotify,
    String? moveTo,
    String? errorMessage,
    String? loadingMessage,
    String? message,
    FormzSubmissionStatus? submitStatus,
  }) {
    return HomePageState(
      agentModel: agentModel ?? this.agentModel,
      profileAgentModel: profileAgentModel ?? this.profileAgentModel,
      loginModel: loginModel ?? this.loginModel,
      listAgentModel: listAgentModel ?? this.listAgentModel,
      listAgentBeModel: listAgentBeModel ?? this.listAgentBeModel,
      listNotify: listNotify ?? this.listNotify,
      moveTo: moveTo ?? this.moveTo,
      errorMessage: errorMessage ?? this.errorMessage,
      loadingMessage: loadingMessage ??this.loadingMessage,
      message: message,
      submitStatus: submitStatus ?? FormzSubmissionStatus.initial,
    );
  }
}

class HomePageInitial extends HomePageState {}
