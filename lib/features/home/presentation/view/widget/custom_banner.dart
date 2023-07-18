import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../controller/home_controller.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return CarouselSlider(
          carouselController: controller.carouselController,
          options: CarouselOptions(
            enlargeCenterPage: true,
            scrollPhysics: const BouncingScrollPhysics(),
            viewportFraction: 0.85,
            autoPlay: true,
            height: ManagerHeight.h160,
            onPageChanged: (index, reason) {
              controller.change(index);
            },
          ),
          items: controller.homeDataModel?.banners?.map((i) {
            return Container(
              alignment: AlignmentDirectional.bottomEnd,
              padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w10,
                vertical: ManagerHeight.h10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ManagerRadius.r14),
                image: DecorationImage(
                    image:
                    i.image!.isNotEmpty
                        ? NetworkImage(i.image!.toString())
                        : const NetworkImage("https://i.pinimg.com/originals/96/71/5b/96715bbf8952e54608f71d8894ee5472.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ...List.generate(
                    controller.homeDataModel!.banners!.length,
                        (index) => Container(
                      width: ManagerWidth.w8,
                      height: ManagerHeight.h8,
                      margin: EdgeInsets.only(left: ManagerWidth.w2),
                      decoration: BoxDecoration(
                        color: controller.current == index
                            ? ManagerColors.primaryColor
                            : ManagerColors.grey,
                        borderRadius: BorderRadius.circular(
                          ManagerRadius.r10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
