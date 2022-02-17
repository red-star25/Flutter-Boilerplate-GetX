import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("Request[${options.method}] => PATH: ${options.path}");

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
