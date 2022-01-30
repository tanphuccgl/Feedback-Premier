import 'package:flutter/material.dart';
import 'package:review_premier_pearl/core/utils/my_colors.dart';



Widget elevatedButton(BuildContext context,{required String title,required Function() onPressed }) {
  Size size = MediaQuery.of(context).size;
  return SizedBox(
    width: size.width / 5,
    height: size.width / 20,
    child: ElevatedButton(
      child: Text(
        title ,
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
        
          )),
    ),
  );
}
