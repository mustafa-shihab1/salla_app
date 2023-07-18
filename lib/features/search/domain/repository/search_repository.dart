import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/features/search/data/request/search_request.dart';
import 'package:home_service_application/features/search/domain/model/search_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, Search>> search(SearchRequest searchRequest);
}