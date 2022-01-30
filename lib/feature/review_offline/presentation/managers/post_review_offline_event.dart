part of 'post_review_offline_bloc.dart';

abstract class PostReviewOfflineEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostReviewOfflineE extends PostReviewOfflineEvent {
  final String fullName;
  final String phoneNumber;
  final String checkIn;
  final String room;
  final String review;
  final Function() success;
  final Function() timeout;
  final Function() failure;
  PostReviewOfflineE({
    required this.checkIn,
    required this.failure,
    required this.fullName,
    required this.phoneNumber,
    required this.review,
    required this.room,
    required this.success,
    required this.timeout,
  });
}
