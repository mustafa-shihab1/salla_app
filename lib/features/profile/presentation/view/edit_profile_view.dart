import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_strings.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/core/widgets/base_text_form_field.dart';
import 'package:home_service_application/core/widgets/main_button.dart';
import 'package:home_service_application/features/profile/presentation/controller/profile_controller.dart';
import 'package:home_service_application/features/profile/presentation/view/custom_profile_header.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: ManagerColors.white,
            appBar: AppBar(
              backgroundColor: ManagerColors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: ManagerColors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Text(
                'Edit Profile',
                style: getBoldTextStyle(
                    fontSize: ManagerFontSize.s18,
                    color: ManagerColors.black),
              ),
              centerTitle: true,
            )  ,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomProfileHeader(
                      coverColor: ManagerColors.white,
                      profileImage: controller.profileDataModel!.image!,
                    ),
                    SizedBox(
                      height: ManagerHeight.h140,
                    ),
                    baseTextFormField(
                        controller: controller.nameController,
                        hintText: controller.profileDataModel!.name,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                        }),
                    SizedBox(
                      height: ManagerHeight.h20,
                    ),
                    baseTextFormField(
                        controller: controller.emailController,
                        hintText: controller.profileDataModel!.email,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                        }),
                    SizedBox(
                      height: ManagerHeight.h20,
                    ),
                    baseTextFormField(
                        controller: controller.phoneController,
                        hintText: controller.profileDataModel!.phone,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                        }),
                    SizedBox(
                      height: ManagerHeight.h50,
                    ),
                    mainButton(
                        padding: EdgeInsets.symmetric(vertical: ManagerHeight.h16),
                        child: Text(
                          ManagerStrings.editProfile,
                          style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s22,
                            color: ManagerColors.white,
                          ),
                        ),
                        minWidth: double.infinity,
                        color: ManagerColors.primaryColor,
                        height: ManagerHeight.h44,
                        onPressed: () {
                          controller.updateProfile();
                        }
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}

