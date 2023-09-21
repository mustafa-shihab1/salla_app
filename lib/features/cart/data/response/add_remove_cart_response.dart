import 'package:home_service_application/core/base_response/base_response.dart';
import 'package:home_service_application/features/cart/data/response/add_remove_cart_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_remove_cart_response.g.dart';


@JsonSerializable()
class AddRemoveCartResponse extends BaseResponse{
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'data')
  AddRemoveCartDataResponse? data;

  AddRemoveCartResponse({
    this.status,
    this.data,
  });


  factory AddRemoveCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddRemoveCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddRemoveCartResponseToJson(this);

}