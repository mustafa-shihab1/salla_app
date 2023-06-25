import 'package:dartz/dartz.dart';
import 'package:home_service_application/features/auth/data/mapper/login_mapper.dart';
import 'package:home_service_application/features/auth/domain/model/login.dart';
import 'package:home_service_application/features/auth/domain/repository/login_repository.dart';

import '../../../../config/constants.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../data/data_source/remote_login_data_source.dart';
import '../../data/request/login_request.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RemoteLoginDataSourceImplement _dataSourceImplement;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(this._dataSourceImplement, this.networkInfo);

  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      final response = await _dataSourceImplement.login(loginRequest);
      return Right(response.toDomain());
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