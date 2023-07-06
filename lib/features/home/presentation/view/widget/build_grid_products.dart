import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_icons.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_strings.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/features/home/domain/model/products_model.dart';
import 'package:home_service_application/features/home/presentation/controller/home_controller.dart';

Widget buildGridProduct({
  required ProductsModel model,
  required BuildContext context,
  // required HomeController controller,
}) =>
    GetBuilder<HomeController>(builder: (context) {
      return Container(
        color: ManagerColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ManagerHeight.h30,
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image(
                  image: NetworkImage('${model.image}'),
                  width: double.infinity,
                  height: ManagerHeight.h150,
                ),
                if (model.discount != Constants.noDiscount)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 1.0),
                    color: ManagerColors.discountBoxColor,
                    child: Text(
                      ManagerStrings.discount,
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s12,
                          color: ManagerColors.white),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name}',
                    style:
                        const TextStyle(overflow: TextOverflow.ellipsis, height: 1.3),
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price}\$',
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s12,
                            color: ManagerColors.primaryColor,),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      if (model.discount != 0)
                        Text(
                          '${model.old_price}\$',
                          style: getBoldTextStyle(
                              fontSize: ManagerFontSize.s10,
                              color: ManagerColors.grey,
                              decoration:TextDecoration.lineThrough),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          context.changeFavorites(model);

                        },
                        icon: CircleAvatar(
                          radius: 16.0,
                          backgroundColor: model.in_favorites! ? ManagerColors.primaryColor:ManagerColors.grey,
                          child: ManagerIcons.favorite
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
