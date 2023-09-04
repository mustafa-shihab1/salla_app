import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/features/profile/presentation/controller/profile_controller.dart';
import 'package:home_service_application/features/profile/presentation/view/custom_profile_header.dart';
import 'package:home_service_application/features/profile/presentation/view/widget/custom_settings_item.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ManagerColors.white,
          body: Column(
            children: [
              CustomProfileHeader(
                  coverColor: ManagerColors.white,
                  profileImage: controller.profileDataModel!.image!,
              ),
              SizedBox(
                height: ManagerHeight.h70,
              ),
              Text(
                controller.profileDataModel!.name!,
                style: getBoldTextStyle(
                    fontSize: ManagerFontSize.s18,
                    color: ManagerColors.black),
              ),
              SizedBox(
                height: ManagerHeight.h10,
              ),
              Text(
                controller.profileDataModel!.email!,
                style: getBoldTextStyle(fontSize: ManagerFontSize.s14, color: ManagerColors.grey),),
              SizedBox(
                height: ManagerHeight.h50,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: Container(
                      width: double.infinity,
                      color: Colors.grey[200],
                      height: 1.0,
                    ),
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      controller.changeSettingsScreen(index);
                    },
                      child: CustomSettingsItem(index: index),
                  ),
                  itemCount: 4,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

