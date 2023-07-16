import 'package:flutter/material.dart';

class ManagerColors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color discountBoxColor = Colors.red;
  static const Color primaryColor = Colors.indigoAccent;
  static const Color textColorLight = Color(0xff525167);
  static const Color textColorDark = Colors.white;
  static const Color boldGrey = Color(0xff424242);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color splashLightGrey = Color(0xFFD6D6D6);
  static const Color grey = Colors.grey;
  static const Color transparent = Colors.transparent;

  static Gradient splashGradientColor = const LinearGradient(
    colors: [splashLightGrey, white ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

}