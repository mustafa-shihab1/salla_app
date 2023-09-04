import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/features/home/presentation/controller/home_controller.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          width: double.maxFinite,
          height: ManagerHeight.h375,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(controller.homeDataModel!.products![5].image!),
            ),
          ),
        );
      },
    );
  }
}
