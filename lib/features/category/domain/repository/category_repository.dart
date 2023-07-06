import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/features/category/domain/model/category_model.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoryModel>> category();
}