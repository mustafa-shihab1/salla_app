import 'package:home_service_application/features/home/data/mapper/products_mapper.dart';
import 'package:home_service_application/features/home/data/mapper/banners_mapper.dart';
import 'package:home_service_application/features/home/data/response/home_data_response.dart';
import 'package:home_service_application/features/home/domain/model/home_data_model.dart';

extension HomeDataMapper on HomeDataResponse{
  HomeDataModel toDomain(){
    return HomeDataModel(
      banners: banners?.map((e) => e.toDomain()).toList(),
      products: products?.map((e) => e.toDomain()).toList(),
    );
  }
}