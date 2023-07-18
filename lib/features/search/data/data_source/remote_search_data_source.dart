import 'package:home_service_application/core/network/app_api.dart';
import 'package:home_service_application/features/search/data/request/search_request.dart';
import 'package:home_service_application/features/search/data/response/search_response.dart';


abstract class RemoteSearchDataSource {
  Future<SearchResponse> search(SearchRequest searchRequest);
}

class RemoteSearchDataSourceImplement extends RemoteSearchDataSource {
  final AppApi _appApi;

  RemoteSearchDataSourceImplement(this._appApi);

  @override
  Future<SearchResponse> search(SearchRequest searchRequest) async {
    return await _appApi.search(searchRequest.text);
  }
}