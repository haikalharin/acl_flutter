part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class FetchListMyAgentEvent extends HomePageEvent {
  FetchListMyAgentEvent();
}
class FetchListBeAgentEvent extends HomePageEvent {
  FetchListBeAgentEvent();
}

class FetchListNotifyEvent extends HomePageEvent {
  FetchListNotifyEvent();
}

class HomePageInitialEvent extends HomePageEvent {
  HomePageInitialEvent();
}
