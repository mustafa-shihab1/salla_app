import 'package:json_annotation/json_annotation.dart';

part 'data_category_data_response.g.dart';


@JsonSerializable()
class DataCategoryDataResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'image')
  String? image;


  DataCategoryDataResponse({this.id, this.name,this.image});

  factory DataCategoryDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataCategoryDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataCategoryDataResponseToJson(this);

}