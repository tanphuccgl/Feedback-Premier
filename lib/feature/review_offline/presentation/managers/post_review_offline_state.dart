part of 'post_review_offline_bloc.dart';

@immutable
abstract class PostReviewOfflineState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Empty extends PostReviewOfflineState {}

class Loading extends PostReviewOfflineState {}

class Loaded extends PostReviewOfflineState {}

class Error extends PostReviewOfflineState {
  late final String message;
  Error({required this.message});
}
