import 'package:home_service_application/core/network/app_api.dart';
import 'package:home_service_application/features/cart/data/request/cart_request.dart';
import 'package:home_service_application/features/cart/data/response/add_remove_cart_response.dart';
import 'package:home_service_application/features/cart/data/response/cart_response.dart';


abstract class RemoteCartDataSource {
  Future<CartResponse> cartData();
  Future<AddRemoveCartResponse> addORRemove(CartRequest cartRequest);

}

class RemoteCartDataSourceImplement extends RemoteCartDataSource {
  final AppApi _appApi;

  RemoteCartDataSourceImplement(this._appApi);

  @override
  Future<CartResponse> cartData() async {
    return await _appApi.getCart();
  }

  @override
  Future<AddRemoveCartResponse> addORRemove(CartRequest cartRequest) async{
    return await _appApi.addOrRemove(cartRequest.productId);
  }
}