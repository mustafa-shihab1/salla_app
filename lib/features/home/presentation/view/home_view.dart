import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/core/widgets/box_shimmer.dart';
import 'package:home_service_application/features/home/presentation/view/widget/custom_banner.dart';
import 'package:home_service_application/features/home/presentation/view/widget/custom_products.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/widgets/will_pop_scope.dart';
import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return willPopScope(
          child: Scaffold(
        backgroundColor: ManagerColors.white,
        body: ListView(
          children: [
            SizedBox(height: ManagerHeight.h20),
            controller.homeDataModel.isNull
                ? ShimmerBox(boxHeight: ManagerHeight.h160)
                : const CustomBanner(),
            SizedBox(height: ManagerHeight.h20),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 20),
              child: Row(
                children: [
                  Text(ManagerStrings.newProducts,
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s22,
                          color: ManagerColors.black)),
                  const Spacer(),
                  Text(
                    ManagerStrings.seeAll,
                    style: getBoldTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.grey,
                        decoration: TextDecoration.underline
                    ),

                  ),
                ],
              ),
            ),
            controller.homeDataModel.isNull
                ? ShimmerBox(boxHeight: ManagerHeight.h600)
                : const CustomProducts(),
          ],
        ),
      ));
    });
  }
}
