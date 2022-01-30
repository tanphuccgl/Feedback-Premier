import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:review_premier_pearl/core/utils/my_colors.dart';

/// input không ẩn
Widget input(
    {TextEditingController? controller,
    Iterable<String>? autofillHints,
    BuildContext? context,TextInputType? keyboardType=TextInputType.name,
    String? hintText,
    required Function(String) onChanged}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    height: size.width / 10,
    child: Center(
      child: TextField(
        controller: controller,
        autofillHints: autofillHints,
        maxLines: 1,
        onChanged: onChanged,
        keyboardType: keyboardType,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Cormorant",
            fontWeight: FontWeight.w400,
            fontSize: size.width / 50),
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 5),
            ),
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0)),
            labelText: hintText,
            labelStyle: TextStyle(
                color: Colors.white,
                fontFamily: "Cormorant",
                fontWeight: FontWeight.w400,
                fontSize: size.width / 40)),
      ),
    ),
  );
}

/// input  ẩn
Widget input1(
    {TextEditingController? controller,
    BuildContext? context,
    String? hintText,
    bool? obscureText,
    Function()? onTap,
    Iterable<String>? autofillHints,
    Function(String?)? onChanged}) {
  Size size = MediaQuery.of(context!).size;
  return Container(
    width: size.width,
    height: size.width / 7,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(size.width / 25))),
    child: Padding(
      padding: EdgeInsets.only(left: size.width / 20, top: size.width / 200),
      child: Center(
        child: TextField(
          controller: controller,
          autofillHints: autofillHints,
          maxLines: 1,
          obscureText: obscureText!,
          keyboardType: TextInputType.visiblePassword,
          onEditingComplete: () => TextInput.finishAutofillContext(),
          onChanged: onChanged,
          style: TextStyle(
              color: midnightColor,
              fontFamily: "Cormorant",
              fontWeight: FontWeight.w400,
              fontSize: size.width / 20),
          decoration: InputDecoration(
              suffixIcon: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      child: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onTap: onTap)),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: neroColor,
                  fontFamily: "Cormorant",
                  fontWeight: FontWeight.w400,
                  fontSize: size.width / 20)),
        ),
      ),
    ),
  );
}
