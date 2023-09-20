import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/core/use_case/base_use_case.dart';
import 'package:home_service_application/features/cart/domain/model/cart_model.dart';
import 'package:home_service_application/features/cart/domain/repository/cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartUseCase implements BaseOutUseCase {
  final CartRepository _cartRepository;

  CartUseCase(this._cartRepository);

  @override
  Future<Either<Failure, CartModel>> execute() async {
    return await _cartRepository.getCart();
  }
}