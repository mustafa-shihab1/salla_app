import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/auth/data/mapper/login_mapper.dart';
import 'package:home_service_application/features/auth/domain/model/login_model.dart';
import 'package:home_service_application/features/auth/domain/repository/login_repository.dart';

import '../../../../config/constants.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../data/data_source/remote_login_data_source.dart';
import '../../data/request/login_request.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RemoteLoginDataSource _dataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.login(loginRequest);
        if(response.status==true)
          return Right(response.toDomain());
        else
          return Left(
            Failure(
              ResponseCode.BAD_REQUEST.value,
              ApiConstants.loginFailed.onNull(),
            ),
          );

      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
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