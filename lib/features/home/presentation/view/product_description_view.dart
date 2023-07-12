import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/widgets/will_pop_scope.dart';
import 'package:home_service_application/features/home/presentation/controller/home_controller.dart';
import 'package:home_service_application/features/home/presentation/view/widget/custom_product_image.dart';

class ProductDescriptionView extends StatelessWidget {
  const ProductDescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: GetBuilder<HomeController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: Constants.elevationAppBar,
              backgroundColor: ManagerColors.transparent,
              iconTheme: IconThemeData(
                color: ManagerColors.white,
                size: ManagerIconSize.s36,
              ),
            ),
            extendBodyBehindAppBar: true,
            body: RefreshIndicator(
              color: ManagerColors.primaryColor,
              backgroundColor: ManagerColors.white,
              onRefresh: () async {
                await controller.home();
              },
              child: SingleChildScrollView(
                child: SizedBox(
                  height: ManagerHeight.h600,
                  child: Stack(
                    children: [

                      CustomProductImage(
                        controller: controller,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
