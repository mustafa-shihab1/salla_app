import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:home_service_application/features/splash/presentation/controller/splash_controller.dart';

final instance = GetIt.instance;

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash(){
  Get.delete<SplashController>();
}

initOnBoarding(){
  disposeSplash();
}
