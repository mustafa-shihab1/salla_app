import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:home_service_application/core/storage/local/app_settings_shared_preferences.dart';
import 'package:home_service_application/features/auth/presentation/controller/login_controller.dart';
import 'package:home_service_application/features/on_boarding/presentation/controller/on_boarding_controller.dart';
import 'package:home_service_application/features/splash/presentation/controller/splash_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

initSplash() {
  Get.put<SplashController>(SplashController());
}

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
        () => sharedPreferences,
  );

  instance.registerLazySingleton<AppSettingsSharedPreferences>(
          () => AppSettingsSharedPreferences(instance()));
}

disposeSplash(){
  Get.delete<SplashController>();
}

initOnBoarding() {
  disposeSplash();
  Get.put<OnBoardingController>(OnBoardingController());
}

disposeOnBoarding() {
  Get.delete<OnBoardingController>();
}

initLoginModule() {
  disposeSplash();
  disposeOnBoarding();
  Get.put<LoginController>(LoginController());
}