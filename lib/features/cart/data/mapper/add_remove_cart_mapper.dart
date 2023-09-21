import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/cart/data/mapper/add_remove_cart_data_mapper.dart';
import 'package:home_service_application/features/cart/data/response/add_remove_cart_response.dart';
import 'package:home_service_application/features/cart/domain/model/add_remove_cart_model.dart';

extension AddRemoveCartMapper on AddRemoveCartResponse{
  AddRemoveCartModel toDomain(){
    return AddRemoveCartModel(
      status: status.onNull(),
      data: data!.toDomain(),
    );
  }
}