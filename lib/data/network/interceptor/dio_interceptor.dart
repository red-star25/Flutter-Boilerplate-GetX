import 'package:base_project_getx/data/sharedpref/constants/preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint("Request[${options.method}] => PATH: ${options.path}");

    // Getting token from shared preference and adding it to header of request if it is not null.
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Preferences.auth_token);
    if (token != null) {
      options.headers.putIfAbsent('Authorization', () => token);
      options.headers.addAll({"authorization": "Bearer $token"});
    } else {
      debugPrint('Auth token is null');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("Response Status Code: [${response.statusCode}]");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
        "Error[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    super.onError(err, handler);
  }
}
