import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_icons.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_strings.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/core/widgets/main_button.dart';
import 'package:home_service_application/features/home/domain/model/products_model.dart';
import 'package:home_service_application/features/home/presentation/controller/home_controller.dart';
import 'package:home_service_application/features/product_details/presentation/view/widget/custom_description.dart';
import 'package:home_service_application/features/product_details/presentation/view/widget/cutom_image.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key,required this.productsModel}) : super(key: key);
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) {
      return Scaffold(
        backgroundColor: ManagerColors.white,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
               Stack(
                 alignment: AlignmentDirectional.topEnd,
                 children: [
                   CustomImage(productsModel: productsModel),
                   IconButton(
                     onPressed: () {
                       controller.changeFavorites(productsModel);
                     },
                     iconSize: ManagerIconSize.s40,
                     icon: CircleAvatar(
                         radius: 30.0,
                         backgroundColor: productsModel.in_favorites! ? ManagerColors.primaryColor:ManagerColors.grey,
                         child: Icon(
                           ManagerIcons.favorite,
                           color: ManagerColors.white,
                           size: ManagerIconSize.s22,
                         )
                     ),
                   ),
                 ],
               ),

                SizedBox(height: ManagerHeight.h20),
                CustomDescription(
                  name: productsModel.name!,
                  description:
                      productsModel.description!,
                  price: productsModel.price!,
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(height: ManagerHeight.h20),
                mainButton(
                    padding: EdgeInsets.symmetric(vertical: ManagerHeight.h16),
                    child: Text(
                      ManagerStrings.addToCart,
                      style: getBoldTextStyle(
                        fontSize: ManagerFontSize.s22,
                        color: ManagerColors.white,
                      ),
                    ),
                    minWidth: double.infinity,
                    color: ManagerColors.primaryColor,
                    height: ManagerHeight.h44,
                    onPressed: () {
                    }
                ),
                SizedBox(height: ManagerHeight.h20),
              ],
            ),
          ),
        ),
      );
    });
  }
}
