part of 'detail_candidate_page_bloc.dart';

class DetailCandidatePageState extends Equatable {
  final FormzSubmissionStatus submitStatus;
  final List<TrackingModel>? listTrackModel;

  final String? errorMessage;
  final String? moveTo;

  const DetailCandidatePageState({
    this.listTrackModel = const [],
    this.moveTo,
    this.errorMessage,
    this.submitStatus = FormzSubmissionStatus.initial,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [submitStatus, listTrackModel];

  DetailCandidatePageState copyWith({
    List<TrackingModel>? listTrackModel,
    String? moveTo,
    String? errorMessage,
    FormzSubmissionStatus? submitStatus,
  }) {
    return DetailCandidatePageState(
      listTrackModel: listTrackModel ?? this.listTrackModel,
      moveTo: moveTo ?? this.moveTo,
      errorMessage: errorMessage ?? this.errorMessage,
      submitStatus: submitStatus ?? FormzSubmissionStatus.initial,
    );
  }
}

class DetailCandidatePageInitial extends DetailCandidatePageState {}
