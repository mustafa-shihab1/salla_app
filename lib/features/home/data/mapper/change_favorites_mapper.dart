import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/home/data/response/change_favorites_response.dart';
import 'package:home_service_application/features/home/domain/model/change_favorites_model.dart';

extension ChangeFavoritesMapper on ChangeFavoritesResponse{
  ChangeFavoritesModel toDomain(){
    return ChangeFavoritesModel(
        status: status.onNull(),
    );
  }
}