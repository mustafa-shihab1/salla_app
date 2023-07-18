import 'package:flutter/material.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';

class CustomTextField extends StatelessWidget {
  final Color? iconColor;
  final IconData? prefixIcon;
  final String? hintText;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  // final Function(String)? onSubmitted;

  const CustomTextField({
    this.prefixIcon,
    this.iconColor,
    this.hintText,
    super.key,
    this.onSubmitted,
    // this.onSubmitted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      // onSubmitted: onSubmitted,
      style: getBoldTextStyle(fontSize: ManagerFontSize.s14, color: ManagerColors.grey),
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: iconColor,
          size: 24,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        hintText: hintText,
      ),
      maxLines: 1,
    );
  }
}