import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/search/data/mapper/product_data_mapper.dart';
import 'package:home_service_application/features/search/data/response/data_search_response.dart';
import 'package:home_service_application/features/search/domain/model/data_model.dart';

extension DataSearchMapper on DataResponse{
  Data toDomain() {
    return Data(
      firstPageUrl: firstPageUrl.onNull(),
      lastPage: lastPage.onNull(),
      lastPageUrl: lastPageUrl.onNull(),
      nextPageUrl: nextPageUrl.onNull(),
      path: path.onNull(),
      perPage: perPage.onNull(),
      prevPageUrl: prevPageUrl.onNull(),
      total: total.onNull(),
      data: data!.map((e) => e.toDomain()).toList(),
      currentPage: currentPage.onNull(),
      from: from.onNull(),
      to: to.onNull(),
    );
  }
}