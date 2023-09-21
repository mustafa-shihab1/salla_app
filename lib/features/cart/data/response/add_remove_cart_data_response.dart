import 'package:home_service_application/features/cart/data/response/added_removed_product_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_remove_cart_data_response.g.dart';


@JsonSerializable()
class AddRemoveCartDataResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'quantity')
  int? quantity;
  @JsonKey(name: 'product')
  AddedRemovedProductDataResponse? product;

  AddRemoveCartDataResponse({
    this.id,
    this.quantity,
    this.product,
  });


  factory AddRemoveCartDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AddRemoveCartDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddRemoveCartDataResponseToJson(this);

}