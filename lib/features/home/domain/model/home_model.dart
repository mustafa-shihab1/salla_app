import 'package:home_service_application/core/base_response/base_response.dart';
import 'package:home_service_application/features/home/domain/model/home_data_model.dart';

class HomeModel extends BaseResponse{
  bool? status;
  HomeDataModel? data;

  HomeModel({this.data,this.status});

}