
import 'package:flutter/material.dart';
import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/core/resources/manager_strings.dart';
import 'package:home_service_application/features/on_boarding/presentation/on_boarding_view.dart';
import 'package:home_service_application/features/splash/presentation/view/splash_view.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String onBoardingView = '/on_boarding_view';

}

class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingView:
        initOnBoarding();
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      default:
        return unDefinedRoute();
    }
  }


  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(ManagerStrings.noRoutFound),
        ),
        body: const Center(
          child: Text(ManagerStrings.noRoutFound),
        ),
      ),
    );
  }

}