import 'package:home_service_application/core/network/app_api.dart';
import 'package:home_service_application/features/home/data/response/home_response.dart';


abstract class RemoteHomeDataSource {
  Future<HomeResponse> homeData();
}

class RemoteHomeDataSourceImplement extends RemoteHomeDataSource {
  final AppApi _appApi;

  RemoteHomeDataSourceImplement(this._appApi);

  @override
  Future<HomeResponse> homeData() async {
    return await _appApi.home();
  }
}