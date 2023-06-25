import 'package:home_service_application/features/auth/data/response/login_response.dart';
import 'package:home_service_application/features/auth/domain/model/login.dart';
import 'package:home_service_application/core/extensions/extensions.dart';

extension LoginMapper on LoginResponse {
  toDomain() {
    return Login(token: token.onNull());
  }
}