import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/widgets/will_pop_scope.dart';
import 'package:home_service_application/features/category/domain/model/data_category_data_model.dart';
import 'package:home_service_application/features/category/presentation/controller/category_controller.dart';
import 'package:home_service_application/features/category/presentation/view/widget/category_item.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (controller) {
        return ListView.separated(
          itemBuilder: (context, index) => categoryItem(model: controller.categoryDataModel!.dataCategoryData![index],context: context),
          separatorBuilder: (BuildContext context, int index) =>Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 5.0,bottom: 5.0),
            child: Container(width: double.infinity,color: ManagerColors.lightGrey,height: 1.0,),
          ),
          itemCount: controller.categoryDataModel!.dataCategoryData!.length ,

        );
      },
    );
  }
}

