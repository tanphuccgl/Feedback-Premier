import 'package:flutter/material.dart';
import 'package:review_premier_pearl/core/utils/my_colors.dart';

///splashFactory: InkRipple.splashFactory,
Widget button1({String? title, Function()? onPressed, BuildContext? context}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    width: size.width,
    height: size.width / 7,
    child: ElevatedButton(
      child: Text(
        title!,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Cormorant",
            fontSize: size.width / 20,
            fontWeight: FontWeight.w700),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: apacheColors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width / 25),
            // side: BorderSide(color: Colors.red)
          )),
    ),
  );
}

Widget button2({String? title, Function()? onPressed, BuildContext? context}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    width: size.width / 5,
    height: size.width / 20,
    child: ElevatedButton(
      child: Text(
        title!,
        style: TextStyle(
            color: apacheColors,
            fontFamily: "Cormorant",
            fontSize: size.width / 50,
            fontWeight: FontWeight.w700),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: apacheColors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width / 50),
            // side: BorderSide(color: Colors.red)
          )),
    ),
  );
}
