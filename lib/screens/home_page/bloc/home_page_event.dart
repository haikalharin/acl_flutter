part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class FetchListMyAgentEvent extends HomePageEvent {
  FetchListMyAgentEvent({
    this.filter = 0,
    this.isSearch = false,
    this.keyword,
  });

  final int? filter;
  final bool? isSearch;
  final String? keyword;
}

class FetchListBeAgentEvent extends HomePageEvent {
  FetchListBeAgentEvent({
    this.filter = 0,
    this.isSearch = false,
    this.keyword,
  });

  final int? filter;
  final bool? isSearch;
  final String? keyword;
}

class FetchDataAgentEvent extends HomePageEvent {
  FetchDataAgentEvent();
}

class FetchListNotifyEvent extends HomePageEvent {
  FetchListNotifyEvent();
}

class HomePageInitialEvent extends HomePageEvent {
  HomePageInitialEvent();
}
