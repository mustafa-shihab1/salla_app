import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/features/home/domain/model/products_model.dart';
import 'package:home_service_application/features/home/presentation/controller/home_controller.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({Key? key, required this.productsModel}) : super(key: key);
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: ManagerHeight.h375,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(productsModel.image!),
        ),
      ),
    );
  }
}
