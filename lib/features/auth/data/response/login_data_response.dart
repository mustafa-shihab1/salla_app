import 'package:home_service_application/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_data_response.g.dart';

@JsonSerializable()
class LoginDataResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  bool? name;
  @JsonKey(name: 'email')
  double? email;
  @JsonKey(name: ApiConstants.token)
  String? token;


  LoginDataResponse({this.id, this.name, this.email, this.token});

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataResponseToJson(this);

}