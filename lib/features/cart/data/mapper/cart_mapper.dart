import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/cart/data/mapper/cart_data_mapper.dart';
import 'package:home_service_application/features/cart/data/response/cart_response.dart';
import 'package:home_service_application/features/cart/domain/model/cart_model.dart';

extension CartMapper on CartResponse{
  CartModel toDomain(){
    return CartModel(
      status: status.onNull(),
      data: data!.toDomain(),
    );
  }
}