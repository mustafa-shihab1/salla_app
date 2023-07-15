// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDataResponse _$RegisterDataResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterDataResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    )
      ..phone = json['phone'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$RegisterDataResponseToJson(
        RegisterDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'token': instance.token,
      'phone': instance.phone,
      'image': instance.image,
    };
