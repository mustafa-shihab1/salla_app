import 'package:home_service_application/features/search/data/response/data_search_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';


@JsonSerializable()
class SearchResponse{
  @JsonKey(name: 'status')
  bool? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  DataResponse? data;

  SearchResponse({this.data,this.status});

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchResponseToJson(this);
}