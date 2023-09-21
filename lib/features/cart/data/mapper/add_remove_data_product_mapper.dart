import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/cart/data/response/added_removed_product_data_response.dart';
import 'package:home_service_application/features/cart/domain/model/add_remove_product_data_model.dart';

extension AddRemoveDataProductMapper on AddedRemovedProductDataResponse {
  AddRemoveProductDataModel toDomain() {
    return AddRemoveProductDataModel(
      id: id.onNull(),
      name: name.onNull(),
      price: price.onNull(),
      description: description.onNull(),
      image: image.onNull(),
      discount: discount.onNull(),
      old_price: old_price.onNull(),
    );
  }
}
