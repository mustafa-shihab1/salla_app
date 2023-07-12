import 'package:flutter/material.dart';
import 'package:home_service_application/features/home/presentation/controller/home_controller.dart';
import '../../../../../core/resources/manager_sizes.dart';

class CustomProductImage extends StatelessWidget {
  HomeController controller;

  CustomProductImage({required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        width: double.maxFinite,
        height: ManagerHeight.h375,
        child: Image.network(controller.homeDataModel!.products![controller.index].image!,fit: BoxFit.fill,),
      ),
    );
  }
}
