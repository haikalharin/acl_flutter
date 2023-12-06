part of 'home_page_bloc.dart';

class HomePageState extends Equatable {
  final FormzSubmissionStatus submitStatus;
  final List<CandidateModel>? listAgentModel;
  final List<CandidateBeModel>? listAgentBeModel;
  final List<NotificationModel>? listNotify;
  final LoginModel? loginModel;
  final CandidateModel? agentModel;
  final String? errorMessage;
  final String? moveTo;

  const HomePageState( {
    this.listAgentModel = const [],
    this.listAgentBeModel= const [],
    this.listNotify,
    this.agentModel,
    this.loginModel,
    this.moveTo,
    this.errorMessage,
    this.submitStatus = FormzSubmissionStatus.initial,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [agentModel, listAgentModel, listNotify, submitStatus,loginModel];

  HomePageState copyWith({
    CandidateModel? agentModel,
    LoginModel? loginModel,
    List<CandidateModel>? listAgentModel,
    List<CandidateBeModel>? listAgentBeModel,
    List<NotificationModel>? listNotify,
    String? moveTo,
    String? errorMessage,
    FormzSubmissionStatus? submitStatus,
  }) {
    return HomePageState(
      agentModel: agentModel ?? this.agentModel,
      loginModel: loginModel ?? this.loginModel,
      listAgentModel: listAgentModel ?? this.listAgentModel,
      listAgentBeModel: listAgentBeModel ?? this.listAgentBeModel,
      listNotify: listNotify ?? this.listNotify,
      moveTo: moveTo ?? this.moveTo,
      errorMessage: errorMessage ?? this.errorMessage,
      submitStatus: submitStatus ?? FormzSubmissionStatus.initial,
    );
  }
}

class HomePageInitial extends HomePageState {}
