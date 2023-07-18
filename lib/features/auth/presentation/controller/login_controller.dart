import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_strings.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/core/storage/local/app_settings_shared_preferences.dart';
import 'package:home_service_application/core/widgets/main_button.dart';
import 'package:home_service_application/features/auth/domain/use_case/login_use_case.dart';
import 'package:home_service_application/core/extensions/extensions.dart';
import 'package:home_service_application/routes/routes.dart';

class LoginController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
  instance<AppSettingsSharedPreferences>();

  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  var formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  changeRememberMe(bool status) {
    rememberMe = status;
    update();
  }

  Future<void> login(BuildContext context) async {
    dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpLoadingState,
        message: ManagerStrings.loading,
        title: '',
        retryAction: () {});
    (await _loginUseCase.execute(
      LoginUseCaseInput(email: email.text, password: password.text),

    ))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpErrorState,
        message: l.message,
        title: '',
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w65,
          ),
          child: mainButton(
            child: Text(
              ManagerStrings.ok,
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s16,
                color: ManagerColors.white,
              ),
            ),
            onPressed: () {
              Get.back();
            },
            color: ManagerColors.primaryColor,
            height: ManagerHeight.h40,
          ),
        ),
        retryAction: () {},
      );
    }, (r) {
      _appSettingsSharedPreferences.setEmail(email.text);
      _appSettingsSharedPreferences.setPassword(password.text);
      _appSettingsSharedPreferences.setToken(r.data!.token.onNull());
      Get.back();
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpSuccessState,
        message: ManagerStrings.thanks,
        title: '',
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w65,
          ),
          child: mainButton(
            child: Text(
              ManagerStrings.ok,
              style: getBoldTextStyle(
                fontSize: ManagerFontSize.s16,
                color: ManagerColors.white,
              ),
            ),
            onPressed: () {
              Get.back();
              Get.offAllNamed(Routes.mainView);
            },

            color: ManagerColors.primaryColor,
            height: ManagerHeight.h40,
          ),
        ),
        retryAction: () {},
      );
      Future.delayed(
          const Duration(
            seconds: Constants.loginTimer,
          ), () {
        Get.offAllNamed(Routes.mainView);
      });
    });
  }

}