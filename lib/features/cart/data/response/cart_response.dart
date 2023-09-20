import 'package:home_service_application/core/base_response/base_response.dart';
import 'package:home_service_application/features/cart/data/response/cart_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_response.g.dart';


@JsonSerializable()
class CartResponse extends BaseResponse{
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'data')
  CartDataResponse? data;

  CartResponse({
    this.status,
    this.data,
  });


  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);

}