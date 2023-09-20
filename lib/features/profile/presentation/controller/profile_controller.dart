import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_strings.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/core/widgets/main_button.dart';
import 'package:home_service_application/features/profile/domain/model/profile_data_model.dart';
import 'package:home_service_application/features/profile/domain/use_case/profile_use_case.dart';
import 'package:home_service_application/features/profile/presentation/view/edit_profile_view.dart';
import 'package:home_service_application/routes/routes.dart';

class ProfileController extends GetxController{

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<String> settingTabs = [
    'Edit Profile',
    'My Cart',
    'Change Password',
    'Language',
    'About App',
  ];

  void changeSettingsScreen(int index){
    if (index == 0) {
      Get.toNamed(Routes.editProfileView);
    }
    else if (index == 1) {
      Get.toNamed(Routes.cartView);
    }
    else if (index == 2) {
      // Get.toNamed(Routes.changeLanguageView);
    }
    else if (index == 3) {
      // Get.toNamed(Routes.aboutAppView);
    }
    update();
  }

  ProfileDataModel? profileDataModel ;

  final ProfileUseCase _profileUseCase = instance<ProfileUseCase>();
  final UpdateProfileUseCase updateProfileUseCase = instance<UpdateProfileUseCase>();


  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    BuildContext context = Get.context as BuildContext;
    (await _profileUseCase.execute()).fold((l) {
      dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: l.message,
          title: '',
          retryAction: () {
            Get.back();
          });
    }, (r) {
      profileDataModel = r.data!;
      update();
    });
  }

  Future<void> updateProfile() async {
    BuildContext context = Get.context as BuildContext;
    dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpLoadingState,
        message: ManagerStrings.loading,
        title: '',
        retryAction: () {});

    (await updateProfileUseCase.execute(
      UpdateProfileUseCaseInput(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
      ),
    )).fold((l) {
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpErrorState,
        message: l.message,
        title: '',
        retryAction: () {
          Get.back();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w65,
          ),
          child: mainButton(
            child: Text(
              ManagerStrings.ok,
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s16,
                color: ManagerColors.white,
              ),
            ),
            onPressed: () {
              Get.back();
            },
            color: ManagerColors.primaryColor,
            height: ManagerHeight.h40,
          ),
        ),);
    }, (r) {
      // _appSettingsSharedPreferences.setEmail(email.text);
      Get.back();
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpSuccessState,
        message: ManagerStrings.updated,
        title: '',
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w65,
          ),
          child: mainButton(
            child: Text(
              ManagerStrings.ok,
              style: getBoldTextStyle(
                fontSize: ManagerFontSize.s16,
                color: ManagerColors.white,
              ),
            ),
            onPressed: () {
              Get.back();
            },
            color: ManagerColors.primaryColor,
            height: ManagerHeight.h40,
          ),
        ),
        retryAction: () {},
      );

    });
  }

}