import 'package:flutter/material.dart';

class DrawerItemModel {
  DrawerItemModel({required this.iconPath, required this.title, this.id});

  UniqueKey? id = UniqueKey();
  String title;

  String iconPath;
  static List<DrawerItemModel> menutems = [
    DrawerItemModel(iconPath: 'lib/assets/svg/home_outline.svg', title: 'Home'),
    DrawerItemModel(iconPath: 'lib/assets/svg/search.svg', title: 'Search'),
    DrawerItemModel(
      iconPath: 'lib/assets/svg/star_outline.svg',
      title: 'Favorite',
    ),
    DrawerItemModel(iconPath: 'lib/assets/svg/chat_bubble.svg', title: 'Help'),
  ];

  static List<DrawerItemModel> menuitems2 = [
    DrawerItemModel(
      iconPath: 'lib/assets/svg/clock_outline.svg',
      title: 'History',
    ),
    DrawerItemModel(
      iconPath: 'lib/assets/svg/bell_outline.svg',
      title: 'Notification',
    ),
  ];
}
