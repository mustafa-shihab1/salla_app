import 'package:home_service_application/core/base_model/base_model.dart';
import 'package:home_service_application/features/cart/domain/model/add_remove_cart_data_model.dart';

class AddRemoveCartModel extends BaseModel{
  bool? status;
  AddRemoveCartDataModel? data;

  AddRemoveCartModel({
    this.status,
    this.data,
    super.message,
  });

}