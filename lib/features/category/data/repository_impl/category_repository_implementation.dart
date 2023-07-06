import 'package:dartz/dartz.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/core/internet_checker/internet_checker.dart';
import 'package:home_service_application/features/category/data/data_source/remote_category_data_source.dart';
import 'package:home_service_application/features/category/domain/model/category_model.dart';
import 'package:home_service_application/features/category/domain/repository/category_repository.dart';
import 'package:home_service_application/features/category/data/mapper/category_mapper.dart';

class CategoryRepositoryImplementation implements CategoryRepository {
  final RemoteCategoryDataSource _dataSource;
  final NetworkInfo _networkInfo;

  CategoryRepositoryImplementation(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, CategoryModel>> category() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.categoryData();
        if(response.status==true) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ResponseCode.BAD_REQUEST.value,
              ApiConstants.message.onNull(),
            ),
          );
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION.value,
          ApiConstants.noInternetConnection,
        ),
      );
    }
  }
}
