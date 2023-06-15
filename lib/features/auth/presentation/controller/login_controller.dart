import 'package:get/get.dart';
import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/core/storage/local/app_settings_shared_preferences.dart';

class LoginController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
  instance<AppSettingsSharedPreferences>();


}