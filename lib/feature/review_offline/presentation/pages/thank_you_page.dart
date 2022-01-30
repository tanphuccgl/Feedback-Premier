import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_premier_pearl/core/utils/my_assets.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/pages/review_page.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/widgets/background.dart';
import 'package:review_premier_pearl/feature/review_offline/provider/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../main.dart';


late  Timer timer;

class ThankYouPage extends StatelessWidget {
  static const String routeName = "/ThankYouPage";
  const ThankYouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    String content = AppLocalizations.of(context)!.contentThankYou;
     timer = Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => ReviewPage(
                    onBoarding: true,
                  )),
          (Route<dynamic> route) => false);
    });
  
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Background(
              onBoarding: false,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
