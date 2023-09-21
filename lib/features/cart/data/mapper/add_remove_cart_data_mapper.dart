import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/cart/data/response/add_remove_cart_data_response.dart';
import 'package:home_service_application/features/cart/domain/model/add_remove_cart_data_model.dart';
import 'package:home_service_application/features/cart/data/mapper/add_remove_data_product_mapper.dart';

extension AddRemoveCartDataMapper on AddRemoveCartDataResponse{
  AddRemoveCartDataModel toDomain(){
    return AddRemoveCartDataModel(
      id: id.onNull(),
      quantity: quantity.onNull(),
      product: product!.toDomain(),
    );
  }
}