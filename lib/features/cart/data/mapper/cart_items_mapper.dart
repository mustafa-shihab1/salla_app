import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/cart/data/mapper/product_data_mapper.dart';
import 'package:home_service_application/features/cart/data/response/cart_items_response.dart';
import 'package:home_service_application/features/cart/domain/model/cart_items_model.dart';

extension CartItemsMapper on CartItemsResponse{
  CartItemsModel toDomain(){
    return CartItemsModel(
      id: id.onNull(),
      quantity: quantity.onNull(),
      product: product!.toDomain(),
    );
  }
}