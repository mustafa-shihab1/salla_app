import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/core/use_case/base_use_case.dart';
import 'package:home_service_application/features/category/domain/model/category_model.dart';
import 'package:home_service_application/features/category/domain/repository/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryUseCase implements BaseOutUseCase {
  final CategoryRepository _categoryRepository;

  CategoryUseCase(this._categoryRepository);

  @override
  Future<Either<Failure, CategoryModel>> execute() async {
    return await _categoryRepository.category();
  }
}