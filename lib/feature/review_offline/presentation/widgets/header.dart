import 'package:flutter/material.dart';
import 'package:review_premier_pearl/core/utils/my_assets.dart';
import 'package:review_premier_pearl/core/utils/my_colors.dart';
import 'package:review_premier_pearl/core/utils/page_routers.dart';


class XHeader extends StatelessWidget {
  final bool isHome;
  const XHeader({Key? key, required this.isHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width,
          height: 50,
          color: midnightColor,
        ),
        isHome == true
            ? const SizedBox.shrink()
            : _iconHeader(
                align: Alignment.centerLeft,
                icon: MyAssets.backIcon,
                onTap: () => Navigator.pop(context)),
        _logoIcon(),
        isHome == true
            ? _iconHeader(
                align: Alignment.centerRight,
                icon: MyAssets.createIcon,
                width: 30,
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.formReviewPage))
            : _iconHeader(
                align: Alignment.centerRight,
                icon: MyAssets.homeIcon,
                width: 30,
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.reviewPage)),
      ],
    );
  }
}

Widget _logoIcon() {
  return Align(
      alignment: Alignment.center,
      child: Image.asset(
        MyAssets.logo,
        fit: BoxFit.fill,
        width: 40,
      ));
}

Widget _iconHeader(
    {required String icon,
    required Function() onTap,
    double width = 25,
    Color color = Colors.white,
    required AlignmentGeometry align}) {
  return InkWell(
    onTap: onTap,
    splashColor: Colors.white10,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: align,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            icon,
            color: color,
            width: width,
          ),
        ),
      ),
    ),
  );
}
