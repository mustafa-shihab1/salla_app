import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/cart/data/mapper/cart_items_mapper.dart';
import 'package:home_service_application/features/cart/data/response/cart_data_response.dart';
import 'package:home_service_application/features/cart/domain/model/cart_data_model.dart';

extension CartDataMapper on CartDataResponse{
  CartDataModel toDomain(){
    return CartDataModel(
      cart_items: cart_items!.map((e) => e.toDomain()).toList(),
      sub_total: sub_total.onNull(),
      total: total.onNull(),
    );
  }
}