import 'package:home_service_application/features/profile/data/response/profile_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse{
  @JsonKey(name: 'status')
  bool? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  ProfileDataResponse? data;

  ProfileResponse({this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProfileResponseToJson(this);
}