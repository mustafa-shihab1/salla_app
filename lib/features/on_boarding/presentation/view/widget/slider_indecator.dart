import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/features/on_boarding/presentation/controller/on_boarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
        builder: (controller) =>
            SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                  activeDotColor: ManagerColors.primaryColor,
                  dotHeight: 9,
                  expansionFactor: 3,
                  dotWidth: 10,
                  spacing: 5
                ),
                controller: controller.pageController,
                count: 3,
            ),
    );
  }
}
