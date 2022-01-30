import 'package:equatable/equatable.dart';
import 'package:review_premier_pearl/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:review_premier_pearl/core/usecase/usecase.dart';
import 'package:review_premier_pearl/feature/review_offline/domain/repositories/review_offline_repository.dart';

class PostReviewOffline implements UseCase<bool, PostReviewOfflineParams> {
  late final ReviewOfflineRepository repository;
  PostReviewOffline({required this.repository});

  @override
  Future<Either<Failure, bool>> call(PostReviewOfflineParams params) async {
    return await repository.postReviewOffline(
        fullName: params.fullName,
        phoneNumber: params.phoneNumber,
        checkIn: params.checkIn,
        success: params.success,
        timeout: params.timeout,
        failure: params.failure,
        room: params.room,
        review: params.review);
  }
}

class PostReviewOfflineParams extends Equatable {
  final String fullName;
  final String phoneNumber;
  final String checkIn;
  final String room;
  final String review;
  final Function() success;
  final Function() timeout;
  final Function() failure;
  const PostReviewOfflineParams({
    required this.checkIn,
    required this.failure,
    required this.fullName,
    required this.phoneNumber,
    required this.review,
    required this.room,
    required this.success,
    required this.timeout,
  });

  @override
  List<Object?> get props =>
      [fullName, phoneNumber, checkIn, room, review, success, failure, timeout];
}
