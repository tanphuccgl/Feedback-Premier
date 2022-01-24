
import 'package:flutter/material.dart';
/// tab home
final List<Tab> myTabs = <Tab>[
  itemTab(label: "Guest rooms",),
  itemTab(label: 'Suites',),
  itemTab(label: "Sales",),
  itemTab(label: "Top",),

];

Tab itemTab({ String? label}) {
  return Tab(
    child: Align(
      alignment: Alignment.center,
      child: Text(
        label!,maxLines: 1,
        style: const TextStyle(
            fontFamily: "Quicksand",
            fontSize:15,
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}
/// tab room & suites
final List<Widget> tabsRoomAndSuites = <Widget>[
  itemTabRoomAndSuites(label: "GUEST ROOMS",),
  itemTabRoomAndSuites(label: 'SUITES',),

];

Widget itemTabRoomAndSuites({ String? label}) {
  return Tab(
    child: Text(
      label!,maxLines: 1,
      style: const TextStyle(
          fontFamily: "Quicksand",
          fontSize:15,
          fontWeight: FontWeight.w700),
    ),
  );
}
