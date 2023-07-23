import 'package:home_service_application/features/profile/data/request/update_profile_request.dart';

import '../../../../core/network/app_api.dart';
import '../response/profile_response.dart';

abstract class RemoteProfileDataSource {
  Future<ProfileResponse> getProfile();
  Future<ProfileResponse> updateProfile(UpdateProfileRequest updateRequest);
}

class RemoteProfileDataSourceImplement implements RemoteProfileDataSource {
  final AppApi _appApi;

  RemoteProfileDataSourceImplement(this._appApi);

  @override
  Future<ProfileResponse> getProfile() async {
    return await _appApi.getProfile();
  }

  @override
  Future<ProfileResponse> updateProfile(UpdateProfileRequest updateProfileRequest) async {
    return await _appApi.updateProfile(
      updateProfileRequest.name,
      updateProfileRequest.email,
      updateProfileRequest.phone,

    );
  }
}
