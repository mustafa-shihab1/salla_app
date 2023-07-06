import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/features/category/domain/model/data_category_data_model.dart';
import 'package:home_service_application/features/category/presentation/controller/category_controller.dart';

Widget categoryItem({
  required DataCategoryDataModel model,
  required BuildContext context,
}) =>
    GetBuilder<CategoryController>(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(

          child: Row(
            children: [
              Image(
                image: NetworkImage('${model.image}'),
                width: ManagerWidth.w100,
                height: ManagerHeight.h100,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 15,
              ),

              Text(
                '${model.name}',
                style: getBoldTextStyle(fontSize: ManagerFontSize.s18, color: ManagerColors.black),
              ),
              const Spacer(),
              IconButton(onPressed: (){

              }, icon: const Icon(Icons.arrow_forward_ios_outlined,size: 20,))
            ],
          ),
        ),
      );
    });
