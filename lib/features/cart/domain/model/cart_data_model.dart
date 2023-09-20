import 'package:home_service_application/features/cart/domain/model/cart_items_model.dart';

class CartDataModel{
  List<CartItemsModel>? cart_items;
  double? sub_total;
  double? total;

  CartDataModel({
    this.cart_items,
    this.sub_total,
    this.total,
  });

}