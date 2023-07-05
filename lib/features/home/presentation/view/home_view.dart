import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/features/home/presentation/view/widget/custom_banner.dart';
import 'package:home_service_application/features/home/presentation/view/widget/custom_products.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/widgets/will_pop_scope.dart';
import '../controller/home_controller.dart';


class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: Scaffold(
        backgroundColor: ManagerColors.white,
        appBar: AppBar(
          title: Text(ManagerStrings.salla,style: getBoldTextStyle(fontSize: ManagerFontSize.s20, color: ManagerColors.black),),
          elevation: Constants.elevationAppBar,
          actions: const[ Padding(

            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search_rounded,color: ManagerColors.black,),
          )],
          backgroundColor: ManagerColors.white,
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return ListView(
              children: [
                SizedBox(height: ManagerHeight.h20),
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
                const CustomProducts(),
              ],
            );
          },
        ),
      ),
    );
  }
}
