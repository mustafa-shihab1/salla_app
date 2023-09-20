import 'package:home_service_application/features/cart/data/response/product_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_items_response.g.dart';


@JsonSerializable()
class CartItemsResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'quantity')
  int? quantity;
  @JsonKey(name: 'product')
  ProductDataResponse? product;

  CartItemsResponse({
    this.id,
    this.quantity,
    this.product,
  });


  factory CartItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$CartItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemsResponseToJson(this);

}