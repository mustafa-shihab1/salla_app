import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/cart/data/response/product_data_response.dart';
import 'package:home_service_application/features/cart/domain/model/product_data_model.dart';

extension ProductDataMapper on ProductDataResponse{
  ProductDataModel toDomain(){
    return ProductDataModel(
      id: id.onNull(),
      price: price.onNull(),
      old_price: old_price.onNull(),
      image: image.onNull(),
      name: name.onNull(),
      description: description.onNull(),
      discount: discount.onNull(),
      in_cart: in_cart.onNull(),
      in_favorites: in_favorites.onNull(),
      images: images!.map((e) => e.onNull()).toList(),
    );
  }
}