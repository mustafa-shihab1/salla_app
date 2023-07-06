import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/category/data/response/category_response.dart';
import 'package:home_service_application/features/category/domain/model/category_model.dart';
import 'package:home_service_application/features/category/data/mapper/category_data_mapper.dart';

extension CategoryMapper on CategoryResponse{
  CategoryModel toDomain(){
    return CategoryModel(
      status: status.onNull(),
      categoryData: categoryData?.toDomain(),
    );
  }
}