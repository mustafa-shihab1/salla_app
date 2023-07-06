import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/features/home/presentation/view/widget/custom_banner.dart';
import 'package:home_service_application/features/home/presentation/view/widget/custom_products.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/widgets/will_pop_scope.dart';
import '../controller/home_controller.dart';
import 'package:shimmer/shimmer.dart';


class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return willPopScope(
          child: Scaffold(
            backgroundColor: ManagerColors.white,
            body: ListView(
                  children: [
                    SizedBox(height: ManagerHeight.h20),
                    controller.homeDataModel.isNull?
                    SizedBox(
                      width: double.infinity,
                      height: ManagerHeight.h160,
                      child: Shimmer.fromColors(
                        baseColor: ManagerColors.white,
                        highlightColor: ManagerColors.lightGrey,
                        child: Container(
                          width: double.infinity,
                          color: ManagerColors.grey,
                        ),
                      ),
                    ):
                    const CustomBanner(),
                    SizedBox(height: ManagerHeight.h20),
                    Container(
                      width: double.infinity,
                      color: ManagerColors.lightGrey,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text(
                          ManagerStrings.newProducts,
                          style: getBoldTextStyle(fontSize: ManagerFontSize.s22, color: ManagerColors.black)
                        ),
                      ),
                    ),
                    controller.homeDataModel.isNull?
                    SizedBox(
                      width: double.infinity,
                      height: ManagerHeight.h600,
                      child: Shimmer.fromColors(
                        baseColor: ManagerColors.white,
                        highlightColor: ManagerColors.lightGrey,
                        child: Container(
                          width: double.infinity,
                          color: ManagerColors.grey,
                        ),
                      ),
                    ):
                    const CustomProducts(),
                  ],
                ),
        )
        );
      }
    );
          }


}
