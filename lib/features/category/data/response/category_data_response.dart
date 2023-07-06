import 'package:home_service_application/features/category/data/response/data_category_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_data_response.g.dart';


@JsonSerializable()
class CategoryDataResponse{
  @JsonKey(name: 'current_page')
  int? current_page;

  @JsonKey(name: 'data')
  List<DataCategoryDataResponse>? dataCategoryData;


  CategoryDataResponse({this.current_page, this.dataCategoryData});

  factory CategoryDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataResponseToJson(this);

}