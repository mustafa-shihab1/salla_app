import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/features/cart/data/request/cart_request.dart';
import 'package:home_service_application/features/cart/domain/model/add_remove_cart_data_model.dart';
import 'package:home_service_application/features/cart/domain/model/add_remove_cart_model.dart';
import 'package:home_service_application/features/cart/domain/model/cart_model.dart';

abstract class CartRepository {
  Future<Either<Failure, CartModel>> getCart();
  Future<Either<Failure, AddRemoveCartModel>> addRemove(CartRequest cartRequest);
}