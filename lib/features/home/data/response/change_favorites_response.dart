import 'package:json_annotation/json_annotation.dart';

part 'change_favorites_response.g.dart';


@JsonSerializable()
class ChangeFavoritesResponse{
  @JsonKey(name: 'status')
  bool? status;

  ChangeFavoritesResponse({this.status});

  factory ChangeFavoritesResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeFavoritesResponseFromJson(json);

  Map<String, dynamic> toJson(ChangeFavoritesResponse instance) =>
      _$ChangeFavoritesResponseToJson(this);
}