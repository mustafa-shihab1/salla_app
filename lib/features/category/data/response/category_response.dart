import 'package:home_service_application/features/category/data/response/category_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';


@JsonSerializable()
class CategoryResponse{
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'data')
  CategoryDataResponse? categoryData;


  CategoryResponse({this.status, this.categoryData});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);

}