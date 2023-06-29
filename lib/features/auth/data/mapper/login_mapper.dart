import 'package:home_service_application/features/auth/data/response/login_response.dart';
import 'package:home_service_application/features/auth/domain/model/login_model.dart';
import 'package:home_service_application/features/auth/data/mapper/login_data_mapper.dart';

extension LoginMapper on LoginResponse {
  Login toDomain() {
    return Login(
      data: data?.toDomain(),
    );
  }
}