import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/features/home/domain/model/products_model.dart';
import 'package:home_service_application/features/home/presentation/controller/home_controller.dart';

Widget favoritesItem({
  required ProductsModel model,
  required BuildContext context,
}) =>
    GetBuilder<HomeController>(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
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
            Flexible(
              child: Text(
                '${model.name}',
                style:
                const TextStyle(overflow: TextOverflow.ellipsis, height: 1.3),
                maxLines: 3,
              ),
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.arrow_forward_ios_outlined,size: 20,),
            ),
          ],
        ),
      );
    });
