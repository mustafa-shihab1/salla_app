import 'package:home_service_application/core/network/app_api.dart';
import 'package:home_service_application/features/category/data/response/category_response.dart';


abstract class RemoteCategoryDataSource {
  Future<CategoryResponse> categoryData();
}

class RemoteCategoryDataSourceImplement extends RemoteCategoryDataSource {
  final AppApi _appApi;

  RemoteCategoryDataSourceImplement(this._appApi);

  @override
  Future<CategoryResponse> categoryData() async {
    return await _appApi.category();
  }
}