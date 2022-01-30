import 'package:flutter/material.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/managers/post_review_offline_bloc.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/widgets/header.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/widgets/bottom_bar.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/widgets/status_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReviewPage extends StatelessWidget {
  final String? fullName;
  final String? phoneNumber;
  final String? room;
  final String? checkIn;
  final bool isHome;
  static const String routeName = "/ReviewPage";
  const ReviewPage({
    Key? key,
    this.checkIn,
    this.fullName,
    this.phoneNumber,
    this.room,
    required this.isHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = AppLocalizations.of(context)!.titleReview;

    PostReviewOfflineBloc.stopTimer(context, nameRoute: "/ReviewPage");
    return Scaffold(
      bottomNavigationBar: const XBottomBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            XHeader(
              isHome: isHome,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
            ),
            StatusList(
              isHome: isHome,
              checkIn: checkIn,
              fullName: fullName,
              phoneNumber: phoneNumber,
              room: room,
            ),
          ],
        ),
      ),
    );
  }
}
