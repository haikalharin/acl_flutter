part of 'home_page_bloc.dart';

enum HomePageStatus { initial, success, error, loading, selected }

extension HomePageStatusX on HomePageStatus {
  bool get isInitial => this == HomePageStatus.initial;
  bool get isSuccess => this == HomePageStatus.success;
  bool get isError => this == HomePageStatus.error;
  bool get isLoading => this == HomePageStatus.loading;
  bool get isSelected => this == HomePageStatus.selected;
}

class HomePageState extends Equatable {
  final HomePageStatus status;
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
    this.status = HomePageStatus.initial,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [ agentModel,listAgentModel,listNotify,status];


  HomePageState copyWith({
    AgentModel? agentModel,
    List<AgentModel>? listAgentModel,
    List<AgentBeModel>? listAgentBeModel,
    List<NotificationModel>? listNotify,
    String? moveTo,
    String? errorMessage,
    HomePageStatus? status,
  }) {
    return HomePageState(
      agentModel: agentModel ?? this.agentModel,
      listAgentModel: listAgentModel ?? this.listAgentModel,
      listAgentBeModel: listAgentBeModel ?? this.listAgentBeModel,
      listNotify: listNotify ?? this.listNotify,
      moveTo: moveTo ?? this.moveTo,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? HomePageStatus.initial,
    );
  }
}

class HomePageInitial extends HomePageState {}
