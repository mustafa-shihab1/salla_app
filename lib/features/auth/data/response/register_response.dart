import 'package:home_service_application/features/auth/data/response/register_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse{

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'status')
  bool? status;

  @JsonKey(name: 'data')
  RegisterDataResponse? data;

  RegisterResponse({this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson(RegisterResponse instance) =>
      _$RegisterResponseToJson(this);
}