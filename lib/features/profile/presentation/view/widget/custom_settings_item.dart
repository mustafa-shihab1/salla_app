import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/features/profile/presentation/controller/profile_controller.dart';

class CustomSettingsItem extends StatelessWidget {
  final int index;
  const CustomSettingsItem({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SettingsController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Text(
                  controller.settingTabs[index],
                  style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s18,
                      color: ManagerColors.black),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
