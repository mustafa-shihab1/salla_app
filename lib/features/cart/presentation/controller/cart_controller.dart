import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/features/cart/domain/model/cart_data_model.dart';
import 'package:home_service_application/features/cart/domain/use_case/add_remove_cart_use_case.dart';
import 'package:home_service_application/features/cart/domain/use_case/cart_use_case.dart';

class CartController extends GetxController {
  final CartUseCase _cartUseCase = instance<CartUseCase>();
  final AddRemoveCartUseCase _addRemoveCartUseCase =
      instance<AddRemoveCartUseCase>();
  CartDataModel? cartDataModel;


  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  increaseQuantity(int index) {
    cartDataModel!.cart_items![index].quantity =
        cartDataModel!.cart_items![index].quantity! + 1;
    update();
  }

  decreaseQuantity(int index) {
    if (cartDataModel!.cart_items![index].quantity! > 1) {
      cartDataModel!.cart_items![index].quantity =
          cartDataModel!.cart_items![index].quantity! - 1;
      update();
    }
  }

  removeItem(int index) {
    addOrRemoveCartItem(cartDataModel!.cart_items![index].product!.id!);
    cartDataModel!.cart_items!.removeAt(index);
    update();
  }

  Future<void> getCartItems() async {
    BuildContext context = Get.context as BuildContext;
    (await _cartUseCase.execute()).fold((l) {
      dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: l.message,
          title: '',
          retryAction: () {
            Get.back();
          });
    }, (r) {
      cartDataModel = r.data;
      update();
    });
  }

  Future<void> addOrRemoveCartItem(int productId) async {
    BuildContext context = Get.context as BuildContext;
    (await _addRemoveCartUseCase.execute(CartUseCaseInput(productId: productId))).fold(
        (l) {
        dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: l.message,
          title: '',
          retryAction: () {
            Get.back();
          });
        },
        (r) {
          getCartItems();
          dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpSuccessState,
          message: 'Successfully Processed',
          title: '',
          retryAction: () {
            Get.back();
          });
  }
    );
  }
}