import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/search/data/response/product_data_response.dart';
import 'package:home_service_application/features/search/domain/model/product_data_model.dart';

extension ProductDataMapper on ProductDataResponse{
  ProductData toDomain() {
    return ProductData(
      id: id.onNull(),
      price: price.onNull(),
      oldPrice: oldPrice.onNull(),
      discount: discount.onNull(),
      image: image.onNull(),
      name: name.onNull(),
      description: description.onNull(),
      images: images!.map((e) => e.toString()).toList(),
      inFavorites: inFavorites.onNull(),
      inCart: inCart.onNull(),
    );
  }
}