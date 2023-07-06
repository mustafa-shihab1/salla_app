// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDataResponse _$CategoryDataResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryDataResponse(
      current_page: json['current_page'] as int?,
      dataCategoryData: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DataCategoryDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryDataResponseToJson(
        CategoryDataResponse instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.dataCategoryData,
    };
