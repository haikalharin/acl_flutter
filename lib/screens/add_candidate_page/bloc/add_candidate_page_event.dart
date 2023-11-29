part of 'add_candidate_page_bloc.dart';


@immutable
abstract class AddCandidatePageEvent {}

class FetchMasterDataEvent extends AddCandidatePageEvent {
  FetchMasterDataEvent();
}

class UserNameInputEvent extends AddCandidatePageEvent {
  final String userName;

  UserNameInputEvent(this.userName);
}

class PasswordInputEvent extends AddCandidatePageEvent {
  final String password;

  PasswordInputEvent(this.password);
}

class AddAgentSubmittedEvent extends AddCandidatePageEvent {

  AddAgentSubmittedEvent();
}


class AddCandidatePageInitialEvent extends AddCandidatePageEvent {

  AddCandidatePageInitialEvent();
}
