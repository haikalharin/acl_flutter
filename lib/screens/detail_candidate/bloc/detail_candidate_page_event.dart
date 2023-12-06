part of 'detail_candidate_page_bloc.dart';

@immutable
abstract class DetailCandidatePageEvent {}

class FetchListTrackingEvent extends DetailCandidatePageEvent {
  FetchListTrackingEvent(this.id);
  final String? id;
}