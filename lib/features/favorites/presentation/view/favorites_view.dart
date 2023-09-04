import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/features/home/presentation/controller/home_controller.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes.dart';


class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) {
          return ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Image(
                    image:NetworkImage('${controller.images[index]}'),
                    width: ManagerWidth.w100,
                    height: ManagerHeight.h100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(
                     '${controller.names[index]} ',
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          height: 1.3,
                      ),
                      maxLines: 4,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  // const Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 5.0,bottom: 5.0),
              child: Container(width: double.infinity,color: ManagerColors.lightGrey,height: 1.0,),
            ),
            itemCount: controller.names.length ,
          );
        }
    );
  }


}
