part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class FetchListMyAgentEvent extends HomePageEvent {
  FetchListMyAgentEvent({this.filter = 0});
  final int? filter;
}
class FetchListBeAgentEvent extends HomePageEvent {
  FetchListBeAgentEvent({this.filter = 0});
  final int? filter;
}

class FetchListNotifyEvent extends HomePageEvent {
  FetchListNotifyEvent();
}

class HomePageInitialEvent extends HomePageEvent {
  HomePageInitialEvent();
}
