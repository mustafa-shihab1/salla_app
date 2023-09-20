import 'package:home_service_application/features/cart/data/response/cart_items_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_data_response.g.dart';


@JsonSerializable()
class CartDataResponse{
  @JsonKey(name: 'cart_items')
  List<CartItemsResponse>? cart_items;
  @JsonKey(name: 'sub_total')
  double? sub_total;
  @JsonKey(name: 'total')
  double? total;

  CartDataResponse({
    this.cart_items,
    this.sub_total,
    this.total,
  });


  factory CartDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CartDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataResponseToJson(this);

}