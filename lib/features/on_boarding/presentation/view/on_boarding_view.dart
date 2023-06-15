import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/features/on_boarding/presentation/controller/on_boarding_controller.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (controller) =>
          Scaffold(
            backgroundColor: ManagerColors.white,
      appBar: AppBar(
        backgroundColor: ManagerColors.white,
        elevation: Constants.elevationAppBar,
        actions: [
          TextButton(onPressed: (){controller.skipPage();}, child: Text('SKIP',style: TextStyle(color: ManagerColors.primaryColor),))
        ],
      ),
      body: PageView(
        controller: controller.pageController,
        children: [
          ...controller.pageViewItems,
        ],
        onPageChanged: (index) {
          controller.setCurrentPage(index);
        },
      ),
    ),
    );
  }
}
