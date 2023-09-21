import 'package:json_annotation/json_annotation.dart';

part 'added_removed_product_data_response.g.dart';


@JsonSerializable()
class AddedRemovedProductDataResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'price')
  double? price;
  @JsonKey(name: 'old_price')
  double? old_price;
  @JsonKey(name: 'discount')
  double? discount;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name:'description')
  String? description;
  AddedRemovedProductDataResponse({this.id,
    this.price,
    this.old_price,
    this.discount,
    this.image,
    this.name,
    this.description,
  });


  factory AddedRemovedProductDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AddedRemovedProductDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddedRemovedProductDataResponseToJson(this);

}