import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_premier_pearl/core/utils/my_assets.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/managers/post_review_offline_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/widgets/status_widget.dart';

class StatusList extends StatelessWidget {
  final String? fullName;
  final String? phoneNumber;
  final String? room;
  final String? checkIn;
  final bool isHome;
  static const String routeName = "/ReviewPage";
  const StatusList({
    Key? key,
    this.checkIn,
    this.fullName,
    this.phoneNumber,
    this.room,
    required this.isHome,
  }) : super(key: key);

  void onPressedStatus(BuildContext context,
      {required bool isHome, required String review}) {
    isHome == true
        ? null
        : PostReviewOfflineBloc.postReview(context,
            fullName: fullName ?? "N/A",
            checkIn: checkIn ?? "N/A",
            phoneNumber: phoneNumber ?? "N/A",
            review: review,
            room: room!);
  }

  @override
  Widget build(BuildContext context) {
    final labelveryUnHappy = AppLocalizations.of(context)!.labelveryUnHappy;

    final labelUnHappy = AppLocalizations.of(context)!.labelUnHappy;

    final labelNormal = AppLocalizations.of(context)!.labelNormal;
    final labelHappy = AppLocalizations.of(context)!.labelHappy;
    final labelveryHappy = AppLocalizations.of(context)!.labelveryHappy;
    return BlocBuilder<PostReviewOfflineBloc, PostReviewOfflineState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatusWidget(
              assetIcon: MyAssets.veryunhappyIcon,
              label: labelveryUnHappy,
              onPressed: () {
                onPressedStatus(context, isHome: isHome, review: "veryunhappy");
              },
            ),
            StatusWidget(
                assetIcon: MyAssets.unhappyIcon,
                label: labelUnHappy,
                onPressed: () {
                  onPressedStatus(context, isHome: isHome, review: "unhappy");
                }),
            StatusWidget(
                assetIcon: MyAssets.normalIcon,
                label: labelNormal,
                onPressed: () {
                  onPressedStatus(context, isHome: isHome, review: "normal");
                }),
            StatusWidget(
                assetIcon: MyAssets.happyIcon,
                label: labelHappy,
                onPressed: () {
                  onPressedStatus(context, isHome: isHome, review: "happy");
                }),
            StatusWidget(
                assetIcon: MyAssets.veryhappyIcon,
                label: labelveryHappy,
                onPressed: () {
                  onPressedStatus(context, isHome: isHome, review: "veryhappy");
                }),
          ],
        ),
      );
    });
  }
}
