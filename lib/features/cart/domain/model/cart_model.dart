import 'package:home_service_application/core/base_model/base_model.dart';
import 'package:home_service_application/features/cart/domain/model/cart_data_model.dart';

class CartModel extends BaseModel{
  bool? status;
  CartDataModel? data;

  CartModel({
    this.status,
    this.data,
    super.message,
  });

}