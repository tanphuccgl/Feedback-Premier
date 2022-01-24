import 'package:dartz/dartz.dart';
import 'package:review_premier_pearl/core/error/failures.dart';

abstract class ReviewOfflineRepository {
  Future<Either<Failure, bool>> postReviewOffline({
    required String fullName,
      required String phoneNumber,
      required String checkIn,
      required Function() success,
      required Function() timeout,
      required Function() failure,
      required String room,
      required String review
  });
}
