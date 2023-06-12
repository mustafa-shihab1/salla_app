import 'package:get/get.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: Constants.splashDuration,
        ), () {
      Get.offAllNamed(
        Routes.onBoardingView,
      );
    });
  }
}