import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageTiles {
  IconData? iconsused;
  String? details;
  String? counter;

  HomePageTiles({this.iconsused, this.details, this.counter});
}

List<HomePageTiles> cardTile = homePageCard
    .map((item) => HomePageTiles(
        counter: item["counter"] as String?,
        details: item["details"] as String?,
        iconsused: item["iconsused"] as IconData?))
    .toList();

var homePageCard = [
  {
    "iconsused": Icons.assignment_ind_outlined,
    "details": "Total Employee",
    "counter": "50"
  },
  {
    "iconsused": CupertinoIcons.profile_circled,
    "details": "Total Clients",
    "counter": "12"
  },
  {
    "iconsused": Icons.battery_alert_outlined,
    "details": "Filled Cylinder",
    "counter": "1000"
  },
  {
    "iconsused": Icons.assignment_ind_outlined,
    "details": "Empty Cylinder",
    "counter": "274"
  },
];
