import 'package:home_service_application/core/base_model/base_model.dart';
import 'package:home_service_application/features/auth/domain/model/login_data_model.dart';

class Login extends BaseModel{
  LoginDataModel? data;

  Login({
    this.data,
    super.message,
  });
}