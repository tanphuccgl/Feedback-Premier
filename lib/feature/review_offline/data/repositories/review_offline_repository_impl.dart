import 'package:review_premier_pearl/core/error/exceptions.dart';
import 'package:review_premier_pearl/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:review_premier_pearl/core/network/network_info.dart';
import 'package:review_premier_pearl/feature/review_offline/data/data_sources/review_offline_data_source.dart';
import 'package:review_premier_pearl/feature/review_offline/domain/repositories/review_offline_repository.dart';

class ReviewOfflineRepositoryImpl extends ReviewOfflineRepository {
  late final NetworkInfo networkInfo;
  late final ReviewOfflineDataSource reviewOfflineDataSource;
  ReviewOfflineRepositoryImpl(
      {required this.networkInfo, required this.reviewOfflineDataSource});
  @override
  Future<Either<Failure, bool>> postReviewOffline(
      {required String fullName,
      required String phoneNumber,
      required String checkIn,
      required Function() success,
      required Function() timeout,
      required Function() failure,
      required String room,
      required String review}) {
    return _postReviewOffline(
        postReviewOffline: reviewOfflineDataSource.postReviewOffline(
            fullName: fullName,
            room: room,
            checkIn: checkIn,
            phoneNumber: phoneNumber,
            success: success,
            timeout: timeout,
            failure: failure,
            review: review));
  }

  Future<Either<Failure, bool>> _postReviewOffline(
      {required Future<bool> postReviewOffline}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await postReviewOffline;
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
