import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:home_service_application/config/constants.dart';
import 'package:home_service_application/core/resources/manager_strings.dart';
import 'package:home_service_application/core/storage/local/app_settings_shared_preferences.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../config/dependency_injection.dart';

class DioFactory {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
  instance<AppSettingsSharedPreferences>();

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      ApiConstants.authorization:
      getAuthorization(_appSettingsSharedPreferences.getToken()),
      ApiConstants.acceptLanguage : ApiConstants.english,
    };

    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: headers,
      sendTimeout: const Duration(
        seconds: ApiConstants.sendTimeOutDuration,
      ),
      receiveTimeout: const Duration(
        seconds: ApiConstants.receiveTimeOutDuration,
      ),
    );

    InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      options.headers[ApiConstants.authorization] = getAuthorization(
        _appSettingsSharedPreferences.getToken(),
      );
      return handler.next(options);
    });

    dio.interceptors.add(interceptorsWrapper);

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          responseBody: true,
          requestBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      );
    }

    return dio;
  }

  String getAuthorization(String token) {
    return '${ManagerStrings.bearer} $token';
  }
}
