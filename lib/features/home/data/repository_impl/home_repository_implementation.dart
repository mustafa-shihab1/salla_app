import 'package:dartz/dartz.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/core/internet_checker/internet_checker.dart';
import 'package:home_service_application/features/home/data/data_source/remote_home_data_source.dart';
import 'package:home_service_application/features/home/data/mapper/home_mapper.dart';
import 'package:home_service_application/features/home/domain/model/home_model.dart';
import 'package:home_service_application/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final RemoteHomeDataSource _dataSource;
  final NetworkInfo _networkInfo;

  HomeRepositoryImplementation(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, HomeModel>> home() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.homeData();
        if(response.status==true)
          return Right(response.toDomain());
        else
          return Left(
            Failure(
              ResponseCode.BAD_REQUEST.value,
              ApiConstants.message.onNull(),
            ),
          );
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
