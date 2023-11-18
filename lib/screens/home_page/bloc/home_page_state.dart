part of 'home_page_bloc.dart';

class HomePageState extends Equatable {
  final FormzSubmissionStatus submitStatus;
  final List<AgentModel>? listAgentModel;
  final List<AgentBeModel>? listAgentBeModel;
  final List<NotificationModel>? listNotify;
  final AgentModel? agentModel;
  final String? errorMessage;
  final String? moveTo;

  const HomePageState({
    this.listAgentModel,
    this.listAgentBeModel,
    this.listNotify,
    this.agentModel,
    this.moveTo,
    this.errorMessage,
    this.submitStatus = FormzSubmissionStatus.initial,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [agentModel, listAgentModel, listNotify, submitStatus];

  HomePageState copyWith({
    AgentModel? agentModel,
    List<AgentModel>? listAgentModel,
    List<AgentBeModel>? listAgentBeModel,
    List<NotificationModel>? listNotify,
    String? moveTo,
    String? errorMessage,
    FormzSubmissionStatus? submitStatus,
  }) {
    return HomePageState(
      agentModel: agentModel ?? this.agentModel,
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
