import 'package:home_service_application/features/auth/data/response/login_data_response.dart';
import 'package:home_service_application/features/auth/domain/model/login_data_model.dart';
import 'package:home_service_application/core/extensions/extensions.dart';

extension LoginDataMapper on LoginDataResponse {
  LoginDataModel toDomain() {
    return LoginDataModel(
      id: id.onNull(),
      name: name.onNull(),
      email: email.onNull(),
      token: token.onNull(),
    );
  }
}