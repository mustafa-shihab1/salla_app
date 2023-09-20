// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemsResponse _$CartItemsResponseFromJson(Map<String, dynamic> json) =>
    CartItemsResponse(
      id: json['id'] as int?,
      quantity: json['quantity'] as int?,
      product: json['product'] == null
          ? null
          : ProductDataResponse.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartItemsResponseToJson(CartItemsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
    };
