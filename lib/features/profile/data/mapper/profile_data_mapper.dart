import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/profile/data/response/profile_data_response.dart';
import 'package:home_service_application/features/profile/domain/model/profile_data_model.dart';

extension ProfileDataMapper on ProfileDataResponse {
  ProfileDataModel toDomain() {
    return ProfileDataModel(
      id: id.onNull(),
      name: name.onNull(),
      email: email.onNull(),
      token: token.onNull(),
      phone: phone.onNull(),
      image: image.onNull(),
    );
  }
}