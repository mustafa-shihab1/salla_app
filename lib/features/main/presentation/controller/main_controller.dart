import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_icons.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/features/home/presentation/view/home_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainController extends GetxController {
  PersistentTabController persistentTabController =
  PersistentTabController(initialIndex: 0);

  Color color = ManagerColors.black;
  List<Widget> screens = [
    HomeView(),
    // *********  For test only ***********
    Container(color: Colors.red,),
    Container(color: Colors.yellowAccent,),
    Container(color: Colors.teal,),
  ];

  List<PersistentBottomNavBarItem> bottomNavBarItems = [
    PersistentBottomNavBarItem(
      icon: ManagerIcons.home,
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
      iconSize: ManagerRadius.r26,
    ),
    PersistentBottomNavBarItem(
      icon: ManagerIcons.categories,
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
      iconSize: ManagerRadius.r26,
    ),
    PersistentBottomNavBarItem(
      icon: ManagerIcons.favorites,
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
      iconSize: ManagerRadius.r26,
    ),
    PersistentBottomNavBarItem(
      icon: ManagerIcons.settings,
      iconSize: ManagerRadius.r26,
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
    ),
  ];
}
