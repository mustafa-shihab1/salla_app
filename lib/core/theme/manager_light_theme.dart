import 'package:flutter/material.dart';
import 'package:home_service_application/core/resources/manager_text_theme_light.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,

    /// MAIN COLORS APP
    // primaryColor: ManagerColors.primaryColor,
    // primaryColorLight: ManagerColors.primaryColorLight,

    // this for disabled button colors
    // disabledColor: ManagerColors.textColor,
    // splashColor: ManagerColors.greyLight,
    // scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColorLight,

    /// APP BAR THEME
    appBarTheme: AppBarTheme(
      centerTitle: true,
      // color: ManagerColors.greyLight,
      // elevation: Constants.elevationAppBar,
      // titleTextStyle: getBoldTextStyle(
      //   fontSize: ManagerFontSize.s14,
      //   color: ManagerColors.primaryColor,
      // ),
    ),

    /// BUTTON THEME
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      // disabledColor: ManagerColors.greyLight,
      // buttonColor: ManagerColors.buttonColorLight,
    ),

    textTheme: ManagerTextThemeLight(),
  );
}