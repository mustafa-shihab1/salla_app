import 'package:json_annotation/json_annotation.dart';

part 'banners_response.g.dart';

@JsonSerializable()
class BannersResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'image')
  String? image;



  BannersResponse({this.id,this.image});

  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BannersResponseToJson(this);

}