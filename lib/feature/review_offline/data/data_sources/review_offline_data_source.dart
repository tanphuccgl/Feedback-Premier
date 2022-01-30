import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:review_premier_pearl/core/config/constants.dart';

abstract class ReviewOfflineDataSource {
  Future<bool> postReviewOffline(
      {required String fullName,
      required String room,
      required String checkIn,
      required String phoneNumber,
      required Function() success,
      required Function() timeout,
      required Function() failure,
      required String review});
}

class ReviewOfflineDateSourceImpl implements ReviewOfflineDataSource {
  late final http.Client client;
  ReviewOfflineDateSourceImpl({required this.client});
  @override
  Future<bool> postReviewOffline(
      {required String fullName,
      required String phoneNumber,
      required String room,
      required Function() success,
      required Function() timeout,
      required Function() failure,
      required String checkIn,
      required String review}) {
    return _postReviewOffline(
        fullName: fullName,
        phoneNumber: phoneNumber,
        checkIn: checkIn,
        failure: failure,
        success: success,
        timeout: timeout,
        room: room,
        review: review);
  }

  Future<bool> _postReviewOffline(
      {required String fullName,
      required String phoneNumber,
      required String checkIn,
      required Function() success,
      required Function() timeout,
      required Function() failure,
      required String room,
      required String review}) async {
    String checkOut = DateTime.now().toString();
    var body = jsonEncode({
      "fullName": fullName,
      "phoneNumber": phoneNumber,
      "room": room,
      "checkIn": checkIn,
      "checkOut": checkOut,
      "review": review
    });

    final response = await client
        .post(Uri.parse("$mainUrl/ReviewOffline/CreateReviewOffline"),
            headers: {
              "Accept": "application/json",
              "content-type": "application/json",
            },
            body: body)
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response("Error", 408);
    });
    log("postReviewOffline " + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode ==201) {
      success();
      return true;
    } else if (response.statusCode == 408) {
      timeout();
      return false;
    } else {
      failure();
      return false;
    }
  }
}
