import 'package:home_service_application/core/base_model/base_model.dart';
import 'package:home_service_application/features/profile/domain/model/profile_data_model.dart';

class Profile extends BaseModel{
  ProfileDataModel? data;

  Profile({
    this.data,
    super.message,
  });
}