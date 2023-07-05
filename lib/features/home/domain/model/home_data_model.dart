import 'package:home_service_application/features/home/domain/model/banners_model.dart';
import 'package:home_service_application/features/home/domain/model/products_model.dart';

class HomeDataModel{
  List<BannersModel>? banners;
  List<ProductsModel>? products;


  HomeDataModel({this.banners, this.products});

}