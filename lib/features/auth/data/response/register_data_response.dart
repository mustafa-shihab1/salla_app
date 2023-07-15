import 'package:home_service_application/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_data_response.g.dart';

@JsonSerializable()
class RegisterDataResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: ApiConstants.name)
  String? name;
  @JsonKey(name: ApiConstants.email)
  String? email;
  @JsonKey(name: ApiConstants.token)
  String? token;
  @JsonKey(name: ApiConstants.phone)
  String? phone;
  @JsonKey(name: ApiConstants.image)
  String? image;


  RegisterDataResponse({this.id, this.name, this.email, this.token});

  factory RegisterDataResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDataResponseToJson(this);

}