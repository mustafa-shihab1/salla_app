import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/features/profile/domain/model/profile_data_model.dart';
import 'package:home_service_application/features/profile/domain/use_case/profile_use_case.dart';

class ProfileController extends GetxController{

  List<String> settingTabs = [
    'Change Password',
    'Language',
    'About App',
    'Rate App',
  ];

  ProfileDataModel? profileDataModel ;

  final ProfileUseCase _profileUseCase = instance<ProfileUseCase>();


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




}