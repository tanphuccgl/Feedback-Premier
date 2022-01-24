import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_premier_pearl/core/config/constants.dart';
import 'package:review_premier_pearl/core/error/failures.dart';
import 'package:review_premier_pearl/feature/review_offline/domain/usecases/post_review_offline.dart';
part 'post_review_offline_state.dart';
part 'post_review_offline_event.dart';

class PostReviewOfflineBloc
    extends Bloc<PostReviewOfflineEvent, PostReviewOfflineState> {
   final PostReviewOffline? postReviewOffline;
  PostReviewOfflineBloc( {this.postReviewOffline}) : super(Empty());

  @override
  Stream<PostReviewOfflineState> mapEventToState(
      PostReviewOfflineEvent event) async* {
    if (event is PostReviewOfflineE) {
    
      final result = await postReviewOffline!(PostReviewOfflineParams(
          checkIn: event.checkIn,
          failure: event.failure,
          fullName: event.fullName,
          phoneNumber: event.phoneNumber,
          review: event.review,
          room: event.room,
          success: event.success,
          timeout: event.timeout));
      yield* _eitherLoadedOrErrorState(result);
    }
  }

  Stream<PostReviewOfflineState> _eitherLoadedOrErrorState(
      Either<Failure, bool> failureOrsuccess) async* {
    yield failureOrsuccess.fold(
        (l) => Error(message: _mapFailureToMessage(l)), (r) => Loaded());
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return "Unexpected error";
    }
  }
}
