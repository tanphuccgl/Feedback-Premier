import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:review_premier_pearl/core/utils/my_assets.dart';
import 'package:review_premier_pearl/core/utils/my_dialogs.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/managers/post_review_offline_bloc.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/widgets/background.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/widgets/status_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:review_premier_pearl/feature/review_offline/provider/locale_provider.dart';

class ReviewPage extends StatelessWidget {
  final String? fullName;
  final String? phoneNumber;
  final String? room;
  final String? checkIn;
  final bool? onBoarding;
  static const String routeName = "/ReviewPage";
  const ReviewPage({
    Key? key,
    this.checkIn,
    this.fullName,
    this.phoneNumber,
    this.room,
    this.onBoarding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    final locale = provider.locale;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        width: size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                provider.setLocale(const Locale('vi'));
              },
              icon: Image.asset(MyAssets.flagVN),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {
                provider.setLocale(const Locale('en'));
              },
              icon: Image.asset(MyAssets.flagUS),
              iconSize: 30,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Background(
              onBoarding: onBoarding ?? false,
            ),
            BlocBuilder<PostReviewOfflineBloc, PostReviewOfflineState>(
                builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: SizedBox(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StatusWidget(
                        assetIcon: MyAssets.veryunhappyIcon,
                        label: AppLocalizations.of(context)!.labelveryUnHappy,
                        onPressed: () {
                          onBoarding == true
                              ? null
                              : _postReviewOffline(context,
                                  fullName: fullName!,
                                  checkIn: checkIn!,
                                  phoneNumber: phoneNumber!,
                                  review: "veryunhappy",
                                  room: room!);
                        },
                      ),
                      StatusWidget(
                          assetIcon: MyAssets.unhappyIcon,
                          label: AppLocalizations.of(context)!.labelUnHappy,
                          onPressed: () {
                            onBoarding == true
                                ? null
                                : _postReviewOffline(context,
                                    fullName: fullName!,
                                    checkIn: checkIn!,
                                    phoneNumber: phoneNumber!,
                                    review: "unhappy",
                                    room: room!);
                          }),
                      StatusWidget(
                          assetIcon: MyAssets.normalIcon,
                          label: AppLocalizations.of(context)!.labelNormal,
                          onPressed: () {
                            onBoarding == true
                                ? null
                                : _postReviewOffline(context,
                                    fullName: fullName!,
                                    checkIn: checkIn!,
                                    phoneNumber: phoneNumber!,
                                    review: "normal",
                                    room: room!);
                          }),
                      StatusWidget(
                          assetIcon: MyAssets.happyIcon,
                          label: AppLocalizations.of(context)!.labelHappy,
                          onPressed: () {
                            onBoarding == true
                                ? null
                                : _postReviewOffline(context,
                                    fullName: fullName!,
                                    checkIn: checkIn!,
                                    phoneNumber: phoneNumber!,
                                    review: "happy",
                                    room: room!);
                          }),
                      StatusWidget(
                          assetIcon: MyAssets.veryhappyIcon,
                          label: AppLocalizations.of(context)!.labelveryHappy,
                          onPressed: () {
                            onBoarding == true
                                ? null
                                : _postReviewOffline(context,
                                    fullName: fullName!,
                                    checkIn: checkIn!,
                                    phoneNumber: phoneNumber!,
                                    review: "veryhappy",
                                    room: room!);
                          }),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  void _postReviewOffline(BuildContext context,
      {required String checkIn,
      required String fullName,
      required String phoneNumber,
      required String review,
      required String room}) {
    BlocProvider.of<PostReviewOfflineBloc>(context).add(PostReviewOfflineE(
      checkIn: checkIn,
      failure: () {
        errorDialog(
            context: context,
            function: () {
              Navigator.pop(context);
            },
            description: AppLocalizations.of(context)!.descripFailure);
      },
      fullName: fullName,
      phoneNumber: phoneNumber,
      review: review,
      room: room,
      success: () {
        successDialog(
            context: context,
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReviewPage(
                            onBoarding: true,
                          )));
            },
            description: AppLocalizations.of(context)!.descripSuccess);
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
