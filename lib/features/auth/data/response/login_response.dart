import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/core/base_response/base_response.dart';
import 'package:home_service_application/features/auth/data/response/login_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse{
  @JsonKey(name: 'status')
  bool? status;

  @JsonKey(name: 'data')
  LoginDataResponse? data;

  LoginResponse({this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson(LoginResponse instance) =>
      _$LoginResponseToJson(this);
}