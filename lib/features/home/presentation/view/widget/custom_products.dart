import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/features/home/presentation/view/widget/build_grid_products.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../controller/home_controller.dart';

class CustomProducts extends StatefulWidget {
  const CustomProducts({Key? key}) : super(key: key);

  @override
  State<CustomProducts> createState() => _CustomProductsState();
}

class _CustomProductsState extends State<CustomProducts> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          color: ManagerColors.lightGrey,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisSpacing: GridViewConstants.crossAxisSpacing,
            mainAxisSpacing: GridViewConstants.mainAxisSpacing,
            childAspectRatio: GridViewConstants.childAspectRatio,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: GridViewConstants.crossAxisCount,
            children: List.generate(
              controller.homeDataModel!.products!.length,
                  (index) =>
                  buildGridProduct(model: controller.homeDataModel!.products![index],context: context,),
            ),
          ),
        );
      },
    );
  }
}

