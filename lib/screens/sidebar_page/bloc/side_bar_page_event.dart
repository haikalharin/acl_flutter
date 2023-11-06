part of 'side_bar_page_bloc.dart';

@immutable
abstract class SideBarPageEvent {}

class GetUserInfoEvent extends SideBarPageEvent {


  GetUserInfoEvent();
}

class SideBarPageEventEvent extends SideBarPageEvent {

  SideBarPageEventEvent();
}