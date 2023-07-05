import 'package:home_service_application/features/home/data/response/banners_response.dart';
import 'package:home_service_application/features/home/data/response/products_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_data_response.g.dart';


@JsonSerializable()
class HomeDataResponse{
  @JsonKey(name: 'banners')
  List<BannersResponse>? banners;
  @JsonKey(name: 'products')
  List<ProductsResponse>? products;


  HomeDataResponse({this.banners, this.products});

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);

}