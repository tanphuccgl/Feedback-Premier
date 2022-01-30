
import 'package:flutter/material.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/managers/post_review_offline_bloc.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/widgets/bottom_bar.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/widgets/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ThankYouPage extends StatelessWidget {
  static const String routeName = "/ThankYouPage";
  const ThankYouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String content = AppLocalizations.of(context)!.contentThankYou;

    PostReviewOfflineBloc.fromThankYouPageToReviewPage(context);
    return Scaffold(
      bottomNavigationBar: const XBottomBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const XHeader(
              isHome: false,
            ),
            _contentFeedback(context, content: content)
          ],
        ),
      ),
    );
  }
}

Widget _contentFeedback(BuildContext context, {required String content}) {
  final size = MediaQuery.of(context).size;
  final padding = MediaQuery.of(context).padding.top;

  return Padding(
    padding: EdgeInsets.only(top: padding),
    child: SizedBox(
      width: size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20),
        ),
      ),
    ),
  );
}
