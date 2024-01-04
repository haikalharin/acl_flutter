import 'dart:async';

import 'package:acl_flutter/data/repository/candidate/candidate_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';

import '../../../data/model/tracking_model/tracking_model.dart';

part 'detail_candidate_page_event.dart';
part 'detail_candidate_page_state.dart';

class DetailCandidatePageBloc extends Bloc<DetailCandidatePageEvent, DetailCandidatePageState> {
  final CandidateRepository candidateRepository;

  DetailCandidatePageBloc({required this.candidateRepository}) : super(DetailCandidatePageInitial()) {
    on<FetchListTrackingEvent>(fetchListTracking);
  }

  Future<void> fetchListTracking(
      FetchListTrackingEvent event, Emitter<DetailCandidatePageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
    try {
      final result = await candidateRepository.fetchListTracking(
          candidateId: event.id ?? '');
      result.when(success: (response) {
        List<TrackingModel> listTracking = response.data;
        emit(state.copyWith(
            listTrackModel: listTracking,
            submitStatus: FormzSubmissionStatus.success));
      }, failure: (error) {
        emit(state.copyWith(submitStatus: FormzSubmissionStatus.failure, errorMessage: error));
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
