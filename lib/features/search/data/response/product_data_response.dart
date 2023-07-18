import 'package:json_annotation/json_annotation.dart';

part 'product_data_response.g.dart';


@JsonSerializable()
class ProductDataResponse {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'price')
  double? price;

  @JsonKey(name: 'oldPrice')
  double? oldPrice;

  @JsonKey(name: 'discount')
  double? discount;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'images')
  List<String>? images;

  @JsonKey(name: 'inFavorites')
  bool? inFavorites;

  @JsonKey(name: 'inCart')
  bool? inCart;

  ProductDataResponse({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });
  factory ProductDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDataResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductDataResponseToJson(this);
}