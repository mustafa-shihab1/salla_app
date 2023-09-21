
import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/core/use_case/base_use_case.dart';
import 'package:home_service_application/features/cart/data/request/cart_request.dart';
import 'package:home_service_application/features/cart/domain/model/add_remove_cart_data_model.dart';
import 'package:home_service_application/features/cart/domain/model/add_remove_cart_model.dart';
import 'package:home_service_application/features/cart/domain/repository/cart_repository.dart';

class CartUseCaseInput {
  int? productId;
  CartUseCaseInput({
    required this.productId,
  });
}

class AddRemoveCartUseCase implements BaseUseCase<CartUseCaseInput, AddRemoveCartModel> {
  final CartRepository _cartRepository;

  AddRemoveCartUseCase(this._cartRepository);

  @override
  Future<Either<Failure, AddRemoveCartModel>> execute(CartUseCaseInput input) async {
    return await _cartRepository.addRemove(
      CartRequest(
        productId: input.productId,
      ),
    );
  }
}