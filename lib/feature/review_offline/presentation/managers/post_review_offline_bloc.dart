import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_premier_pearl/core/config/constants.dart';
import 'package:review_premier_pearl/core/error/failures.dart';
import 'package:review_premier_pearl/core/utils/my_dialogs.dart';
import 'package:review_premier_pearl/core/utils/page_routers.dart';
import 'package:review_premier_pearl/feature/review_offline/domain/usecases/post_review_offline.dart';

import '../../../../main.dart';

part 'post_review_offline_state.dart';
part 'post_review_offline_event.dart';

class PostReviewOfflineBloc
    extends Bloc<PostReviewOfflineEvent, PostReviewOfflineState> {
  final PostReviewOffline? postReviewOffline;
  PostReviewOfflineBloc({this.postReviewOffline}) : super(Empty());

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

  static void stopTimer(BuildContext context, {required String nameRoute}) {
    if (ModalRoute.of(context)!.settings.name == nameRoute &&
        timer.isActive == true) {
      timer.cancel();
    }
  }

  static void fromThankYouPageToReviewPage(BuildContext context) {
    timer = Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          PageRoutes.reviewPage, (Route<dynamic> route) => false);
    });
  }

  static void postReview(BuildContext context,
      {required String checkIn,
      required String fullName,
      required String phoneNumber,
      required String review,
      required String room}) {
    BlocProvider.of<PostReviewOfflineBloc>(context).add(PostReviewOfflineE(
      checkIn: checkIn,
      failure: () {
        Navigator.pushNamed(context, PageRoutes.thankYouPage);
      },
      fullName: fullName,
      phoneNumber: phoneNumber,
      review: review,
      room: room,
      success: () {
        Navigator.pushNamed(context, PageRoutes.thankYouPage);
      },
      timeout: () {
        maintenanceDialog(
            context: context,
            function: () {
              Navigator.pop(context);
            });
      },
    ));
  }
}
