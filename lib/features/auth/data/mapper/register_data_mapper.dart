import 'package:home_service_application/features/auth/data/response/register_data_response.dart';
import 'package:home_service_application/features/auth/domain/model/register_data_model.dart';
import 'package:home_service_application/core/extensions/extensions.dart';

extension RegisterDataMapper on RegisterDataResponse {
  RegisterDataModel toDomain() {
    return RegisterDataModel(
      id: id.onNull(),
      name: name.onNull(),
      email: email.onNull(),
      token: token.onNull(),
      image: image.onNull(),
      phone: phone.onNull(),
    );
  }
}