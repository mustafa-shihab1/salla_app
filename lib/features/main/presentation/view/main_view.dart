import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/features/main/presentation/controller/main_controller.dart';
import 'package:home_service_application/routes/routes.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/widgets/will_pop_scope.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: GetBuilder<MainController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(controller.appBarTitles[controller.currentIndex],
                style: getBoldTextStyle(fontSize: ManagerFontSize.s20, color: ManagerColors.black)),
              elevation: Constants.elevationAppBar,
              centerTitle: true,
              actions: [ controller.currentIndex==0 ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: IconButton(icon: const Icon(Icons.search_rounded,color: ManagerColors.boldGrey,),
                    onPressed:()=> Get.toNamed(Routes.searchView)),
              ):Container()],
              backgroundColor: ManagerColors.white,
            ),
            body: PersistentTabView(
              context,
              controller: controller.persistentTabController,
              backgroundColor: Colors.white,
              navBarStyle: NavBarStyle.style2,
              confineInSafeArea: true,
              navBarHeight: ManagerHeight.h60,
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    ManagerRadius.r16,
                  ),
                  topRight: Radius.circular(
                    ManagerRadius.r16,
                  ),
                ),
              ),
              screens: controller.screens,
              items: controller.bottomNavBarItems,
              onItemSelected: (value) {
                controller.changeTitleIndex(value);
              },
            ),
          );
        },
      ),
    );
  }
}
