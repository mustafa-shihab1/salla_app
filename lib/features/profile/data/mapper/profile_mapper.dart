import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/features/profile/data/mapper/profile_data_mapper.dart';
import 'package:home_service_application/features/profile/data/response/profile_response.dart';
import 'package:home_service_application/features/profile/domain/model/profile_model.dart';

extension ProfileMapper on ProfileResponse {
  Profile toDomain() {
    return Profile(
      data: data?.toDomain(),
      message: message.onNull(),
    );
  }
}