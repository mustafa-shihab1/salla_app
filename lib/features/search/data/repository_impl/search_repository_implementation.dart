import 'package:dartz/dartz.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/core/internet_checker/internet_checker.dart';
import 'package:home_service_application/features/search/data/data_source/remote_search_data_source.dart';
import 'package:home_service_application/features/search/data/mapper/search_mapper.dart';
import 'package:home_service_application/features/search/data/request/search_request.dart';
import 'package:home_service_application/features/search/domain/model/search_model.dart';
import 'package:home_service_application/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImplementation implements SearchRepository {
  final RemoteSearchDataSource _dataSource;
  final NetworkInfo _networkInfo;

  SearchRepositoryImplementation(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, Search>> search(SearchRequest searchRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.search(searchRequest);
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
