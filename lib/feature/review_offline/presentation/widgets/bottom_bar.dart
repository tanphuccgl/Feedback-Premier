import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_premier_pearl/core/utils/my_assets.dart';
import 'package:review_premier_pearl/feature/review_offline/provider/locale_provider.dart';

class XBottomBar extends StatelessWidget {
  
  const XBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<LocaleProvider>(context, listen: false);
    return Row(
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
    );
  }
}
