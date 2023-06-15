import 'package:home_service_application/config/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:home_service_application/core/extensions/extensions.dart';

class AppSettingsSharedPreferences {
  final SharedPreferences _sharedPreferences;

  AppSettingsSharedPreferences(this._sharedPreferences);

  Future<void> setOutBoardingViewed() async {
    await _sharedPreferences.setBool(
      ConstantsPrefsKeys.onBoardingViewedKey,
      true,
    );
  }

  bool getOutBoardingViewed() {
    return _sharedPreferences
        .getBool(
      ConstantsPrefsKeys.onBoardingViewedKey,
    ).onNull();
  }
}