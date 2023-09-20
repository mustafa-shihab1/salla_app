import 'package:home_service_application/features/cart/domain/model/product_data_model.dart';

class CartItemsModel{
  int? id;
  int? quantity;
  ProductDataModel? product;

  CartItemsModel({
    this.id,
    this.quantity,
    this.product,
  });
}