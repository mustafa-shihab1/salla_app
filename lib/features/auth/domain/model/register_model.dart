import 'package:home_service_application/features/auth/domain/model/register_data_model.dart';

class Register{
  RegisterDataModel? data;
  String? message;
  bool? status;

  Register({
    this.data,
    this.message,
    this.status,
  });
}