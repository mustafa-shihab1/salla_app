//const String basePath = '/api';

class Constants {
  static const double deviceWidth = 412;
  static const double deviceHeight = 869;
  static const int splashDuration = 3;
  static const int onBoardingDurationTime = 1;
  static const double elevationAppBar = 0;
  static const int loginFirstPartFlex = 1;
  static const int loginSecondPartFlex = 3;
  static const double getStateWidgetRenderStateElevation = 3;
  static const int loginTimer = 1;
}

class RequestConstants {
  static const String login = 'login';//'$basePath/login';
}
class ConstantsPrefsKeys {
  static const String onBoardingViewedKey = 'on_boarding_viewed';
  static const String token = 'token';
  static const String email = 'email';
  static const String password = 'password';
  static const String loggedIn = 'logged_in';
}

class ApiConstants {
  static const String baseUrl = 'https://student.valuxapps.com/api/';
  static const String authorization = 'authorization';
  static const int sendTimeOutDuration = 120;
  static const int receiveTimeOutDuration = 120;
  static const String token = 'token';
  static const String name = 'name';
  static const String email = 'email';
  static const String password = 'password';
  static const String message = 'message';
  static const String loginFailed = 'login Failed';
  static const String errors = 'errors';
  static const String error = 'error';
  static const String badRequest = 'Bad Request';
  static const String noInternetConnection = 'No Internet connection';
  static const String acceptLanguage = 'Accept-Language';
  static const String english = 'en';
  static const String arabic = 'ar';
}
