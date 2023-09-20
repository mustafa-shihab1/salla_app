
import 'package:dartz/dartz.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/core/internet_checker/internet_checker.dart';
import 'package:home_service_application/features/cart/data/data_source/remote_cart_data_source.dart';
import 'package:home_service_application/features/cart/data/mapper/cart_mapper.dart';
import 'package:home_service_application/features/cart/domain/model/cart_model.dart';
import 'package:home_service_application/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final RemoteCartDataSource _dataSource;
  final NetworkInfo _networkInfo;

  CartRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, CartModel>> getCart() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.cartData();
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
