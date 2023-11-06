part of 'side_bar_page_bloc.dart';


enum SideBarPageStatus { initial, success, error, loading, selected }

extension SideBarPageStatusX on SideBarPageStatus {
  bool get isInitial => this == SideBarPageStatus.initial;
  bool get isSuccess => this == SideBarPageStatus.success;
  bool get isError => this == SideBarPageStatus.error;
  bool get isLoading => this == SideBarPageStatus.loading;
  bool get isSelected => this == SideBarPageStatus.selected;
}

class SideBarPageState extends Equatable {
  final SideBarPageStatus status;
  final LoginModel? userModel;
  final String? moveTo;

  const SideBarPageState( {
    this.userModel,
    this.moveTo,
    this.status = SideBarPageStatus.initial,

  });




  @override
  List<Object?> get props => [ userModel,status];

  SideBarPageState copyWith({
    LoginModel? userModel,
    String? moveTo,
    SideBarPageStatus? status,
  }) {
    return SideBarPageState(
      userModel: userModel ?? this.userModel,
      moveTo: moveTo ?? this.moveTo,
      status: status ?? SideBarPageStatus.initial,
    );
  }
}

class SideBarPageInitial extends SideBarPageState {}