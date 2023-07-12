import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_icons.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_strings.dart';
import 'package:home_service_application/features/category/presentation/view/category_view.dart';
import 'package:home_service_application/features/favorites/presentation/view/favorites_view.dart';
import 'package:home_service_application/features/home/presentation/view/home_view.dart';
import 'package:home_service_application/features/profile/presentation/view/profile_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainController extends GetxController {
  PersistentTabController persistentTabController =
  PersistentTabController(initialIndex: 0);

  Color color = ManagerColors.black;
  int currentIndex = 0;
  List<String> appBarTitles=[
    'Salla','Categories','Favorites','Profile'
  ];

  List<Widget> screens = [
    HomeView(),
    CategoryView(),
    FavoritesView(),
    ProfileView(),
  ];

  changeTitleIndex(int value){
    currentIndex =value;
    update();
  }
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
