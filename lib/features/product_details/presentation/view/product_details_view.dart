import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/features/home/presentation/controller/home_controller.dart';
import 'package:home_service_application/features/product_details/presentation/view/widget/cutom_image.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ManagerColors.transparent,
          iconTheme: IconThemeData(
            color: ManagerColors.grey,
            size: ManagerIconSize.s30,
          ),
        ),
        body: Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: ManagerHeight.h20),
             const CustomImage(),

              // SizedBox(height: ManagerHeight.h20),
              // CustomDescription(
              //   name: controller.homeDataModel!.products![2].name!,
              //   description:
              //       controller.homeDataModel!.products![2].description!,
              //   price: controller.homeDataModel!.products![2].price!,
              //   onRatingUpdate: (rating) {},
              // ),
              // SizedBox(height: ManagerHeight.h20),
              // mainButton(
              //     padding: EdgeInsets.symmetric(vertical: ManagerHeight.h16),
              //     child: Text(
              //       ManagerStrings.addToCard,
              //       style: getBoldTextStyle(
              //         fontSize: ManagerFontSize.s22,
              //         color: ManagerColors.white,
              //       ),
              //     ),
              //     minWidth: double.infinity,
              //     color: ManagerColors.primaryColor,
              //     height: ManagerHeight.h44,
              //     onPressed: () {
              //     }
              // ),
              // SizedBox(height: ManagerHeight.h20),

            ],
          ),
        ),
      );
    });
  }
}
