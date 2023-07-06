import 'package:home_service_application/features/category/domain/model/data_category_data_model.dart';

class CategoryDataModel{

  int? current_page;
  List<DataCategoryDataModel>? dataCategoryData;

  CategoryDataModel({this.current_page, this.dataCategoryData});

}