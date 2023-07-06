import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/features/category/presentation/view/widget/category_item.dart';
import 'package:home_service_application/features/favorites/presentation/view/widget/favorite_item.dart';
import 'package:home_service_application/features/home/presentation/controller/home_controller.dart';
import 'package:home_service_application/features/home/presentation/view/widget/custom_banner.dart';
import 'package:home_service_application/features/home/presentation/view/widget/custom_products.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/widgets/will_pop_scope.dart';
import 'package:shimmer/shimmer.dart';


class FavoritesView extends StatelessWidget {
  FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) {
          return ListView.separated(
            itemBuilder: (context, index) => favoritesItem(model: controller.homeDataModel!.products![index],context: context),
            separatorBuilder: (BuildContext context, int index) =>Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 5.0,bottom: 5.0),
              child: Container(width: double.infinity,color: ManagerColors.lightGrey,height: 1.0,),
            ),
            itemCount: controller.favorits.length ,

          );
        }
    );
  }


}
