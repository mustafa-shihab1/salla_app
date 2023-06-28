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

  Future<void> setToken(String token) async {
    await setLoggedIn();
    await _sharedPreferences.setString(ConstantsPrefsKeys.token, token);
  }

  String getToken() {
    return _sharedPreferences.getString(ConstantsPrefsKeys.token).onNull();
  }

  Future<void> setEmail(String email) async {
    await _sharedPreferences.setString(ConstantsPrefsKeys.email, email);
  }

  String getEmail() {
    return _sharedPreferences.getString(ConstantsPrefsKeys.email).onNull();
  }

  Future<void> setPassword(String password) async {
    await _sharedPreferences.setString(ConstantsPrefsKeys.password, password);
  }

  String getPassword() {
    return _sharedPreferences.getString(ConstantsPrefsKeys.password).onNull();
  }

  Future<void> setLoggedIn() async {
    await _sharedPreferences.setBool(ConstantsPrefsKeys.loggedIn, true);
  }

  bool loggedIn() {
    return _sharedPreferences.getBool(ConstantsPrefsKeys.loggedIn).onNull();
  }

  void clear() {
    _sharedPreferences.clear();
  }

}