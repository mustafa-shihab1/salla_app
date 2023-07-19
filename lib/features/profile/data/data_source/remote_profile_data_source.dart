import '../../../../core/network/app_api.dart';
import '../response/profile_response.dart';

abstract class RemoteProfileDataSource {
  Future<ProfileResponse> getProfile();
}

class RemoteProfileDataSourceImplement implements RemoteProfileDataSource {
  final AppApi _appApi;

  RemoteProfileDataSourceImplement(this._appApi);

  @override
  Future<ProfileResponse> getProfile() async {
    return await _appApi.getProfile();
  }
}
