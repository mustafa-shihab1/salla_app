import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/auth/data/data_source/remote_register_data_source.dart';
import 'package:home_service_application/features/auth/data/request/register_request.dart';
import 'package:home_service_application/features/auth/domain/model/register_model.dart';
import 'package:home_service_application/features/auth/data/mapper/register_mapper.dart';

import 'package:home_service_application/features/auth/domain/repository/register_repository.dart';

import '../../../../config/constants.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
class RegisterRepositoryImpl implements RegisterRepository {
  final RemoteRegisterDataSource _dataSource;
  final NetworkInfo networkInfo;

  RegisterRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Failure, Register>> register(RegisterRequest registerRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.register(registerRequest);
        if(response.status==true) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ResponseCode.BAD_REQUEST.value,
              ApiConstants.registerFailed.onNull(),
            ),
          );
        }

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