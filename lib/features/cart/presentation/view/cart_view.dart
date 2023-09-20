import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_strings.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/core/widgets/box_shimmer.dart';
import 'package:home_service_application/core/widgets/main_button.dart';
import 'package:home_service_application/features/cart/presentation/controller/cart_controller.dart';
import 'package:home_service_application/features/cart/presentation/view/widget/shimmer_list.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CartController>(builder: (controller) {
      return Scaffold(
          backgroundColor: ManagerColors.white,
          appBar: AppBar(
            backgroundColor: ManagerColors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: ManagerColors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            title: Text(
              ManagerStrings.myCart,
              style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s18, color: ManagerColors.black),
            ),
            centerTitle: true,
          ),
          body: controller.cartDataModel.isNull
              ? const Center(
                  child: ShimmerList(),
                )
              : Center(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: size.width * 0.95,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Column(
                            children: [
                              SizedBox(
                                height: ManagerHeight.h10,
                              ),
                              Card(
                                elevation: 0,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  // side: const BorderSide(color: ManagerColors.lightGrey,),
                                ),
                                color: ManagerColors.cartItemColor,
                                child: Dismissible(
                                  key: Key(controller
                                      .cartDataModel!.cart_items![index].id
                                      .toString()),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction) {
                                    controller.removeItem(index);
                                  },
                                  background: Container(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: ManagerColors.dismissibleColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Row(
                                      children: [
                                        Spacer(),
                                        Icon(
                                          Icons.delete,
                                          color: ManagerColors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: ManagerHeight.h120,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 16.0),
                                          child: Container(
                                            width: ManagerWidth.w90,
                                            height: ManagerHeight.h90,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: NetworkImage(controller
                                                    .cartDataModel!
                                                    .cart_items![index]
                                                    .product!
                                                    .image!),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller
                                                    .cartDataModel!
                                                    .cart_items![index]
                                                    .product!
                                                    .name!,
                                                style: getBoldTextStyle(
                                                  fontSize: ManagerFontSize.s12,
                                                  color: ManagerColors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                height: ManagerHeight.h6,
                                              ),
                                              Text(
                                                '${controller.cartDataModel!.cart_items![index].product!.price!} \$',
                                                style: getBoldTextStyle(
                                                  fontSize: ManagerFontSize.s12,
                                                  color: ManagerColors.primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: ManagerWidth.w10,
                                        ),

                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                controller.decreaseQuantity(index);
                                              },
                                              icon: const Icon(
                                                Icons.remove_circle_outline,
                                                color: ManagerColors.primaryColor,
                                              ),
                                            ),
                                            Text(
                                              '${controller.cartDataModel!.cart_items![index].quantity!}',
                                              style: getBoldTextStyle(
                                                fontSize: ManagerFontSize.s12,
                                                color: ManagerColors.black,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                controller.increaseQuantity(index);
                                              },
                                              icon: const Icon(
                                                Icons.add_circle_outline,
                                                color: ManagerColors.primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: ManagerWidth.w12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (index == controller.cartDataModel!.cart_items!.length - 1 && controller.cartDataModel!.cart_items!.length >= 5)
                                SizedBox(
                                  height: ManagerHeight.h120,
                                ),
                            ],
                          ),
                          itemCount: controller.cartDataModel!.cart_items!.length,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, -15),
                              blurRadius: 20,
                              color: const Color(0xFFDADADA).withOpacity(0.15),
                            )
                          ],
                        ),
                        child: SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: "Total : ",
                                      style:
                                      getBoldTextStyle(fontSize: 16, color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: '${controller.cartDataModel!.total!} \$',
                                          style:
                                          getBoldTextStyle(fontSize: 16, color: ManagerColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  mainButton(
                                    padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 12),
                                    child: Text('Buy Now',style: getBoldTextStyle(fontSize: ManagerFontSize.s14, color: ManagerColors.white),),
                                    onPressed: () {},
                                    color: ManagerColors.primaryColor,
                                    height: ManagerHeight.h40,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ManagerHeight.h20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      );
    });
  }
}