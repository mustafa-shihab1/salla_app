import 'package:dartz/dartz.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/core/internet_checker/internet_checker.dart';
import 'package:home_service_application/core/storage/local/app_settings_shared_preferences.dart';
import 'package:home_service_application/features/profile/data/data_source/remote_profile_data_source.dart';
import 'package:home_service_application/features/profile/data/mapper/profile_mapper.dart';
import 'package:home_service_application/features/profile/data/request/update_profile_request.dart';
import 'package:home_service_application/features/profile/domain/model/profile_model.dart';
import 'package:home_service_application/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final RemoteProfileDataSource _dataSource;
  final NetworkInfo networkInfo;
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
  instance<AppSettingsSharedPreferences>();

  ProfileRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.getProfile();
        if(response.status==true) {
          return Right(response.toDomain());
        } else {
          print(response.message);
          return Left(
            Failure(
              ResponseCode.BAD_REQUEST.value,
              ApiConstants.badRequest.onNull(),
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

  @override
  Future<Either<Failure, Profile>> updateProfile(UpdateProfileRequest updateRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.updateProfile(updateRequest);
        if(response.status==true) {
          return Right(response.toDomain());
        } else {
          print(response.message);
          return Left(
            Failure(
              ResponseCode.BAD_REQUEST.value,
              ApiConstants.badRequest.onNull(),
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