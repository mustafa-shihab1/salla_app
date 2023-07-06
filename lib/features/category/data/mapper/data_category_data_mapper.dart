import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/category/data/response/data_category_data_response.dart';
import 'package:home_service_application/features/category/domain/model/data_category_data_model.dart';

extension DataCategoryDataMapper on DataCategoryDataResponse{
  DataCategoryDataModel toDomain(){
    return DataCategoryDataModel(
      id: id.onNull(),
      name: name.onNull(),
      image: image.onNull(),
    );
  }
}