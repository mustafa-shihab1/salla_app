import 'package:get/get.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/core/storage/local/app_settings_shared_preferences.dart';
import 'package:home_service_application/routes/routes.dart';

class SplashController extends GetxController {

  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
  instance<AppSettingsSharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: Constants.splashDuration,
        ), () {
      if (_appSettingsSharedPreferences.getOutBoardingViewed()) {
        Get.offAllNamed(Routes.loginView);
      } else {
        Get.offAllNamed(
          Routes.onBoardingView,
        );
      }
    });
  }
}