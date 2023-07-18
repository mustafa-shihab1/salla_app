import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/core/resources/manager_assets.dart';
import 'package:home_service_application/core/resources/manager_strings.dart';
import 'package:home_service_application/core/storage/local/app_settings_shared_preferences.dart';
import 'package:home_service_application/features/on_boarding/presentation/view/widget/on_boarding_item.dart';
import 'package:home_service_application/routes/routes.dart';

class OnBoardingController extends GetxController {

  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
  instance<AppSettingsSharedPreferences>();

  late PageController pageController;
  static const firstPage = 0;
  static const lastPage = 2;
  int currentPage = firstPage;

  final List pageViewItems = [
    OnBoardingItem(
      image: ManagerAssets.onBoardingImg1,
      title: ManagerStrings.onBoardingTitle1,
      subTitle: ManagerStrings.onBoardingSubTitle1,
    ),
    OnBoardingItem(
      image: ManagerAssets.onBoardingImg2,
      title: ManagerStrings.onBoardingTitle2,
      subTitle: ManagerStrings.onBoardingSubTitle2,
    ),
    OnBoardingItem(
      image: ManagerAssets.onBoardingImg3,
      title: ManagerStrings.onBoardingTitle3,
      subTitle: ManagerStrings.onBoardingSubTitle3,
    ),
  ];
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }


  Future<void> skipPage() async {
    await _appSettingsSharedPreferences.setOutBoardingViewed();
    Get.offAllNamed(Routes.loginView);
  }

  void nextPage() {
    if (isNotLastedPage()) {
      animateToPage(index: ++currentPage);
      update();
    }
  }


  Future<void> animateToPage({required int index}) {
    return pageController.animateToPage(
      index,
      duration: const Duration(seconds: Constants.onBoardingDurationTime),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  Future<void> setCurrentPage(int index) async {
    await _appSettingsSharedPreferences.setOutBoardingViewed();
    currentPage = index;
    update();
  }

  bool isNotLastedPage() {
    return currentPage < lastPage;
  }


}