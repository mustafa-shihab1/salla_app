import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:home_service_application/core/network/app_api.dart';
import 'package:home_service_application/core/network/dio_factory.dart';
import 'package:home_service_application/core/storage/local/app_settings_shared_preferences.dart';
import 'package:home_service_application/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:home_service_application/features/auth/data/repository_impl/login_repository_impl.dart';
import 'package:home_service_application/features/auth/presentation/controller/login_controller.dart';
import 'package:home_service_application/features/home/data/data_source/remote_home_data_source.dart';
import 'package:home_service_application/features/home/data/repository_impl/home_repository_implementation.dart';
import 'package:home_service_application/features/home/domain/repository/home_repository.dart';
import 'package:home_service_application/features/home/domain/use_case/home_usecase.dart';
import 'package:home_service_application/features/home/presentation/controller/home_controller.dart';
import 'package:home_service_application/features/main/presentation/controller/main_controller.dart';
import 'package:home_service_application/features/on_boarding/presentation/controller/on_boarding_controller.dart';
import 'package:home_service_application/features/splash/presentation/controller/splash_controller.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/internet_checker/internet_checker.dart';
import '../features/auth/domain/repository/login_repository.dart';
import '../features/auth/domain/use_case/login_use_case.dart';

final instance = GetIt.instance;


initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
        () => sharedPreferences,
  );

  instance.registerLazySingleton<AppSettingsSharedPreferences>(
          () => AppSettingsSharedPreferences(instance()));

  instance.registerLazySingleton(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppApi>(
        () => AppApi(dio),
  );

  instance.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(
      InternetConnection(),
    ),
  );

}

initSplash() {
  Get.put<SplashController>(SplashController());
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
  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
          () => RemoteLoginDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginRepository>()) {
    instance.registerLazySingleton<LoginRepository>(
          () => LoginRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
          () => LoginUseCase(
        instance<LoginRepository>(),
      ),
    );
  }
  Get.put<LoginController>(LoginController());
}

initMainModule() {
  Get.put<MainController>(MainController());
  initHomeModule();
}


initHomeModule() {
  if (!GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.registerLazySingleton<RemoteHomeDataSource>(
          () => RemoteHomeDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<HomeRepository>()) {
    instance.registerLazySingleton<HomeRepository>(
          () => HomeRepositoryImplementation(
        instance<RemoteHomeDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerLazySingleton<HomeUseCase>(
          () => HomeUseCase(
        instance<HomeRepository>(),
      ),
    );
  }

  Get.put<HomeController>(HomeController());

}
