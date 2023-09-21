// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'added_removed_product_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddedRemovedProductDataResponse _$AddedRemovedProductDataResponseFromJson(
        Map<String, dynamic> json) =>
    AddedRemovedProductDataResponse(
      id: json['id'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      old_price: (json['old_price'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      image: json['image'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AddedRemovedProductDataResponseToJson(
        AddedRemovedProductDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.old_price,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
    };
