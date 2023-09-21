// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_remove_cart_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRemoveCartDataResponse _$AddRemoveCartDataResponseFromJson(
        Map<String, dynamic> json) =>
    AddRemoveCartDataResponse(
      id: json['id'] as int?,
      quantity: json['quantity'] as int?,
      product: json['product'] == null
          ? null
          : AddedRemovedProductDataResponse.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddRemoveCartDataResponseToJson(
        AddRemoveCartDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
    };
