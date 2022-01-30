import 'package:flutter/material.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/pages/review_page.dart';

AppBar customAppBar(BuildContext context)
{
  return  AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ReviewPage(
                          isHome: true,
                        )));
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      );
}