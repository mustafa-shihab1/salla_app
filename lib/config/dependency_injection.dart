import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:home_service_application/core/network/app_api.dart';
import 'package:home_service_application/core/network/dio_factory.dart';
import 'package:home_service_application/core/storage/local/app_settings_shared_preferences.dart';
import 'package:home_service_application/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:home_service_application/features/auth/data/data_source/remote_register_data_source.dart';
import 'package:home_service_application/features/auth/data/repository_impl/login_repository_impl.dart';
import 'package:home_service_application/features/auth/data/repository_impl/register_repository_impl.dart';
import 'package:home_service_application/features/auth/domain/repository/register_repository.dart';
import 'package:home_service_application/features/auth/domain/use_case/register_use_case.dart';
import 'package:home_service_application/features/auth/presentation/controller/login_controller.dart';
import 'package:home_service_application/features/auth/presentation/controller/register_controller.dart';
import 'package:home_service_application/features/cart/data/data_source/remote_cart_data_source.dart';
import 'package:home_service_application/features/cart/data/repository_impl/cart_repository_impl.dart';
import 'package:home_service_application/features/cart/domain/repository/cart_repository.dart';
import 'package:home_service_application/features/cart/domain/use_case/add_remove_cart_use_case.dart';
import 'package:home_service_application/features/cart/domain/use_case/add_remove_cart_use_case.dart';
import 'package:home_service_application/features/cart/domain/use_case/add_remove_cart_use_case.dart';
import 'package:home_service_application/features/cart/domain/use_case/cart_use_case.dart';
import 'package:home_service_application/features/cart/presentation/controller/cart_controller.dart';
import 'package:home_service_application/features/category/data/data_source/remote_category_data_source.dart';
import 'package:home_service_application/features/category/data/repository_impl/category_repository_implementation.dart';
import 'package:home_service_application/features/category/domain/repository/category_repository.dart';
import 'package:home_service_application/features/category/domain/use_case/category_usecase.dart';
import 'package:home_service_application/features/category/presentation/controller/category_controller.dart';
import 'package:home_service_application/features/home/data/data_source/remote_home_data_source.dart';
import 'package:home_service_application/features/home/data/repository_impl/home_repository_implementation.dart';
import 'package:home_service_application/features/home/domain/repository/home_repository.dart';
import 'package:home_service_application/features/home/domain/use_case/home_usecase.dart';
import 'package:home_service_application/features/home/presentation/controller/home_controller.dart';
import 'package:home_service_application/features/main/presentation/controller/main_controller.dart';
import 'package:home_service_application/features/on_boarding/presentation/controller/on_boarding_controller.dart';
import 'package:home_service_application/features/search/data/data_source/remote_search_data_source.dart';
import 'package:home_service_application/features/search/data/repository_impl/search_repository_implementation.dart';
import 'package:home_service_application/features/search/domain/repository/search_repository.dart';
import 'package:home_service_application/features/search/domain/use_case/search_usecase.dart';
import 'package:home_service_application/features/search/presentation/controller/search_controller.dart';
import 'package:home_service_application/features/profile/data/data_source/remote_profile_data_source.dart';
import 'package:home_service_application/features/profile/data/repository_impl/profile_repository_impl.dart';
import 'package:home_service_application/features/profile/domain/repository/profile_repository.dart';
import 'package:home_service_application/features/profile/domain/use_case/profile_use_case.dart';
import 'package:home_service_application/features/profile/presentation/controller/profile_controller.dart';
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

disposeLoginModule() {

  if (GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.unregister<RemoteLoginDataSource>();
  }

  if (GetIt.I.isRegistered<LoginRepository>()) {
    instance.unregister<LoginRepository>();
  }

  if (GetIt.I.isRegistered<LoginUseCase>()) {
    instance.unregister<LoginUseCase>();
  }

  Get.delete<LoginController>();
}

disposeRegisterModule() {
  if (GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.unregister<RemoteRegisterDataSource>();
  }

  if (GetIt.I.isRegistered<RegisterRepository>()) {
    instance.unregister<RegisterRepository>();
  }

  if (GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.unregister<RegisterUseCase>();
  }

  Get.delete<RegisterController>();
}

initRegisterModule() {
  disposeLoginModule();
  if (!GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.registerLazySingleton<RemoteRegisterDataSource>(
          () => RemoteRegisterDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterRepository>()) {
    instance.registerLazySingleton<RegisterRepository>(
          () => RegisterRepositoryImpl(
            instance<RemoteRegisterDataSource>(),
            instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(
          () => RegisterUseCase(
        instance<RegisterRepository>(),
      ),
    );
  }
  Get.put<RegisterController>(RegisterController());
}

initLoginModule() {
  disposeSplash();
  disposeOnBoarding();
  disposeRegisterModule();
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
  initCategoryModule();
  initProfileModule();
}

initProfileModule(){
  if (!GetIt.I.isRegistered<RemoteProfileDataSource>()) {
    instance.registerLazySingleton<RemoteProfileDataSource>(
          () => RemoteProfileDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<ProfileRepository>()) {
    instance.registerLazySingleton<ProfileRepository>(
          () => ProfileRepositoryImpl(
        instance<RemoteProfileDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<ProfileUseCase>()) {
    instance.registerLazySingleton<ProfileUseCase>(
          () => ProfileUseCase(
        instance<ProfileRepository>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<UpdateProfileUseCase>()) {
    instance.registerLazySingleton<UpdateProfileUseCase>(
          () => UpdateProfileUseCase(
        instance<ProfileRepository>(),
      ),
    );
  }
  Get.put<ProfileController>(ProfileController());
}

initCategoryModule() {
  if (!GetIt.I.isRegistered<RemoteCategoryDataSource>()) {
    instance.registerLazySingleton<RemoteCategoryDataSource>(
          () => RemoteCategoryDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<CategoryRepository>()) {
    instance.registerLazySingleton<CategoryRepository>(
          () => CategoryRepositoryImplementation(
        instance<RemoteCategoryDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<CategoryUseCase>()) {
    instance.registerLazySingleton<CategoryUseCase>(
          () => CategoryUseCase(
        instance<CategoryRepository>(),
      ),
    );
  }

  Get.put<CategoryController>(CategoryController());

}

initSearchModule(){

  if (!GetIt.I.isRegistered<RemoteSearchDataSource>()) {
    instance.registerLazySingleton<RemoteSearchDataSource>(
          () => RemoteSearchDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<SearchRepository>()) {
    instance.registerLazySingleton<SearchRepository>(
          () => SearchRepositoryImplementation(
        instance<RemoteSearchDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<SearchUseCase>()) {
    instance.registerLazySingleton<SearchUseCase>(
          () => SearchUseCase(
        instance<SearchRepository>(),
      ),
    );
  }

  Get.put<SearchsController>(SearchsController());

}

disposeSearchModule(){
  Get.delete<SearchsController>();
}

initCartModule(){
  if (!GetIt.I.isRegistered<RemoteCartDataSource>()) {
    instance.registerLazySingleton<RemoteCartDataSource>(
          () => RemoteCartDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<CartRepository>()) {
    instance.registerLazySingleton<CartRepository>(
          () => CartRepositoryImpl(
        instance<RemoteCartDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<CartUseCase>()) {
    instance.registerLazySingleton<CartUseCase>(
          () => CartUseCase(
        instance<CartRepository>(),
      ),
    );
  }
  if(!GetIt.I.isRegistered<AddRemoveCartUseCase>()){
    instance.registerLazySingleton<AddRemoveCartUseCase>(
          () => AddRemoveCartUseCase(
        instance<CartRepository>(),
      ),
    );
  }
  Get.put<CartController>(CartController());
}

