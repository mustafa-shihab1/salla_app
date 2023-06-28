import 'package:flutter/material.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/core/extensions/extensions.dart';

TextFormField baseTextFormField({
  required TextEditingController controller,
  String? hintText,
  TextInputType? keyboardType,
  bool? obscureText,
  validator,
}) {
  return TextFormField(
    style: getBoldTextStyle(
      fontSize: ManagerFontSize.s16,
      color: ManagerColors.black,
    ),    controller: controller,
    keyboardType: keyboardType,
    cursorColor: ManagerColors.primaryColor,
    obscureText: obscureText.onNull(),
    validator: validator,
    decoration: InputDecoration(
      filled: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w16,
        vertical: ManagerHeight.h6,
      ),
      fillColor: ManagerColors.white,
      hintText: hintText.onNull(),
      hintStyle: getBoldTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ManagerColors.grey,
        ),
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ManagerColors.grey,
        ),
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
      ),
    ),
  );
}
