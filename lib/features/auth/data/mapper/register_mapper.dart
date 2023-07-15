import 'package:home_service_application/features/auth/data/response/register_response.dart';
import 'package:home_service_application/features/auth/domain/model/register_model.dart';
import 'package:home_service_application/features/auth/data/mapper/register_data_mapper.dart';

extension LoginMapper on RegisterResponse {
  Register toDomain() {
    return Register(
      data: data?.toDomain(),
      message: message,
      status: status,
    );
  }
}