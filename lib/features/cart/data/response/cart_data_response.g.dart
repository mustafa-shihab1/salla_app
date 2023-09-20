// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDataResponse _$CartDataResponseFromJson(Map<String, dynamic> json) =>
    CartDataResponse(
      cart_items: (json['cart_items'] as List<dynamic>?)
          ?.map((e) => CartItemsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      sub_total: (json['sub_total'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CartDataResponseToJson(CartDataResponse instance) =>
    <String, dynamic>{
      'cart_items': instance.cart_items,
      'sub_total': instance.sub_total,
      'total': instance.total,
    };
