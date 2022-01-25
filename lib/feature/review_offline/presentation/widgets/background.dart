import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_premier_pearl/core/utils/my_assets.dart';
import 'package:review_premier_pearl/core/utils/my_colors.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/pages/form_review_page.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/pages/review_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:review_premier_pearl/feature/review_offline/provider/locale_provider.dart';

class Background extends StatelessWidget {
  final bool onBoarding;
  const Background({Key? key, required this.onBoarding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String title = AppLocalizations.of(context)!.titleReview;
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    final locale = provider.locale;
    return Column(
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: size.width,
              height: size.width / 12,
              color: midnightColor,
            ),
            onBoarding == true
                ? SizedBox.shrink()
                : Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                  ),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  MyAssets.logo,
                  fit: BoxFit.fill,
                  width: 40,
                )),
            onBoarding == false
                ? Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReviewPage(
                                      onBoarding: true,
                                    )));
                      },
                      icon: Icon(Icons.home),
                      color: Colors.white,
                    ),
                  )
                : Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormReviewPage()));
                      },
                      icon: Icon(Icons.corporate_fare_outlined),
                      color: Colors.white,
                    ),
                  ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
      ],
    );
  }
}
