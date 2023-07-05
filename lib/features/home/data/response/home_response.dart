import 'package:home_service_application/core/base_response/base_response.dart';
import 'package:home_service_application/features/home/data/response/home_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';


@JsonSerializable()
class HomeResponse extends BaseResponse{
  @JsonKey(name: 'status')
  bool? status;

  @JsonKey(name: 'data')
  HomeDataResponse? data;

  HomeResponse({this.data,this.status});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson(HomeResponse instance) =>
      _$HomeResponseToJson(this);
}