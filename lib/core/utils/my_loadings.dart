import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  static const String routeName = "/LoadingPage";

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SpinKitCircle(
        color: Colors.lightBlueAccent,
      )),
    );
  }
}

Widget loadingWidget() {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: const Text("fds"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {

        },
      ),
    ),
    body: const Center(
        child: SpinKitCircle(
      color: Colors.lightBlueAccent,
    )),
  );
}
