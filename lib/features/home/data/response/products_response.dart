import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';


@JsonSerializable()
class ProductsResponse{
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
  @JsonKey(name: 'in_favorites')
  bool? in_favorites;
  @JsonKey(name:'in_cart')
  bool? in_cart;
  @JsonKey(name:'images')
  List<String>? images;
  ProductsResponse({this.id,
    this.price,
    this.old_price,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.in_favorites,
    this.in_cart,
    this.images
  });


factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
    _$ProductsResponseFromJson(json);

Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);

}