import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final String assetIcon;
  final String label;
  final Function() onPressed;
  const StatusWidget(
      {Key? key,
      required this.assetIcon,
      required this.label,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: SizedBox(
        width: size.width / 6,
        child: Column(
          children: [
            IconButton(
              icon: Image.asset(assetIcon),
              onPressed: onPressed,
              iconSize: size.width / 8,
            ),
            SizedBox(
              height: size.width / 15,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width / 40,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
