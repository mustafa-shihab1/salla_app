import 'package:home_service_application/features/home/data/response/banners_response.dart';
import 'package:home_service_application/features/home/domain/model/banners_model.dart';
import 'package:home_service_application/core/extensions/extensions.dart';

extension BannersMapper on BannersResponse{
  BannersModel toDomain(){
    return BannersModel(
      id: id.onNull(),
      image: image.onNull(),
    );
  }
}