import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/features/on_boarding/presentation/controller/on_boarding_controller.dart';
import 'package:home_service_application/features/on_boarding/presentation/view/widget/slider_indecator.dart';

class OnBoardingItem extends StatelessWidget {
  String image;
  String title;
  String subTitle;

  OnBoardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
        builder:(controller) =>
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: ManagerHeight.h50),
                  Expanded(child: Image.asset(image,)),
                  // SizedBox(height: ManagerHeight.h70),

                  Text(
                    title,
                    style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s28,
                      color: ManagerColors.black,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h20),
                  Text(
                    subTitle,
                    style: getTextStyle(
                        fontSize: ManagerFontSize.s18,
                        color: ManagerColors.boldGrey,
                        weight: ManagerFontWeight.bold
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h40),
                  Row(
                    children: [
                      const SliderIndicator(),
                      const Spacer(),
                      FloatingActionButton(
                        onPressed: (){
                          controller.nextPage();
                        },
                        child: Icon(Icons.arrow_forward_ios_rounded),
                        backgroundColor: ManagerColors.primaryColor,
                      )
                    ],
                  ),
                  SizedBox(height: ManagerHeight.h20),

                ],
              ),
            ));
  }
}