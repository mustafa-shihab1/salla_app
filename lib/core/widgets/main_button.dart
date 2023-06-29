import 'package:flutter/material.dart';
import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';

Widget mainButton({
  required Widget child,
  void Function()? onPressed,
  ShapeBorder? shapeBorder,
  Color? color,
  double? minWidth,
  double? height,
  double? elevation,
  EdgeInsetsGeometry? padding,
}) {
  return MaterialButton(
    padding: padding,
    onPressed: onPressed.onNull(),
    shape: shapeBorder ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r6,
          ),
        ),
    color: color.onNull(),
    minWidth: minWidth.onNull(),
    height: height.onNull(),
    elevation: elevation.onNull(),
    child: child,
  );
}
