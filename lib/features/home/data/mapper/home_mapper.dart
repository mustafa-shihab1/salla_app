import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/home/data/mapper/home_data_mapper.dart';
import 'package:home_service_application/features/home/data/response/home_response.dart';
import 'package:home_service_application/features/home/domain/model/home_model.dart';

extension HomeMapper on HomeResponse{
  HomeModel toDomain(){
    return HomeModel(
      status: status.onNull(),
      data: data?.toDomain()
    );
  }
}