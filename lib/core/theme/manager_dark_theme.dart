import 'package:flutter/material.dart';
import 'package:home_service_application/core/resources/manager_text_theme_dark.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,

    /// MAIN COLORS APP
    //primaryColor: ManagerColors.primaryColor,
    //primaryColorDark: ManagerColors.primaryColorDark,

    // this for disabled button colors
    //disabledColor: ManagerColors.disabledColor,
    //splashColor: ManagerColors.greyLight,
    //scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColorDark,

    /// APP BAR THEME
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      //color: ManagerColors.greyLight,
      //elevation: Constants.elevationAppBar,
      // titleTextStyle: getBoldTextStyle(
      //   fontSize: ManagerFontSize.s14,
      //   color: ManagerColors.primaryColor,
      // ),
    ),

    /// BUTTON THEME
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      // disabledColor: ManagerColors.greyLight,
      // buttonColor: ManagerColors.buttonColorDarK,
    ),

    textTheme: ManagerTextThemeDark(),
  );
}