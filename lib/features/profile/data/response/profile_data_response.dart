import 'package:json_annotation/json_annotation.dart';

part 'profile_data_response.g.dart';

@JsonSerializable()
class ProfileDataResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'phone')
  String? phone;


  ProfileDataResponse({
    this.id,
    this.name,
    this.email,
    this.token,
    this.image,
    this.phone,
  });
  factory ProfileDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataResponseToJson(this);

}