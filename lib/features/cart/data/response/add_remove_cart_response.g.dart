// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_remove_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRemoveCartResponse _$AddRemoveCartResponseFromJson(
        Map<String, dynamic> json) =>
    AddRemoveCartResponse(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : AddRemoveCartDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..message = json['message'] as String?;

Map<String, dynamic> _$AddRemoveCartResponseToJson(
        AddRemoveCartResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
