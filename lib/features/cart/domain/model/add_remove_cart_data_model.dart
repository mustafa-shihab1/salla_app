import 'package:home_service_application/features/cart/domain/model/add_remove_product_data_model.dart';

class AddRemoveCartDataModel{
  int? id;
  int? quantity;
  AddRemoveProductDataModel? product;

  AddRemoveCartDataModel({
    this.id,
    this.quantity,
    this.product,
  });
}