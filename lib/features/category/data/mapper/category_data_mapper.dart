import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/category/data/mapper/data_category_data_mapper.dart';
import 'package:home_service_application/features/category/data/response/category_data_response.dart';
import 'package:home_service_application/features/category/domain/model/category_data_model.dart';

extension CategoryDataMapper on CategoryDataResponse{
  CategoryDataModel toDomain(){
    return CategoryDataModel(
      current_page: current_page.onNull(),
      dataCategoryData: dataCategoryData?.map((e) => e.toDomain()).toList(),
    );
  }
}