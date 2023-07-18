import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/search/data/mapper/data_search_mapper.dart';
import 'package:home_service_application/features/search/data/response/search_response.dart';
import 'package:home_service_application/features/search/domain/model/search_model.dart';

extension SearchMapper on SearchResponse{
  Search toDomain() {
    return Search(
      status: status.onNull(),
      message: message.onNull(),
      data: data?.toDomain(),
    );
  }
}