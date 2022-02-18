import 'dart:convert';

import 'package:base_project_getx/data/models/auth/login_response_model.dart';
import 'package:base_project_getx/data/models/auth/register_response_model.dart';
import 'package:base_project_getx/data/network/constants/endpoints.dart';
import 'package:base_project_getx/data/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  AuthApi(this._dioClient);

  Future<LoginResponseModel> loginRequest(
      {required String email, required String password}) async {
    try {
      final res = await _dioClient.post(
        Endpoints.login,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
        data:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      );
      return LoginResponseModel.fromJson(res);
    } catch (e) {
      debugPrint("Issue in login" "" + e.toString());
      rethrow;
    }
  }

  Future<RegisterResponseModel> registerRequest(
      {required String email, required String password}) async {
    try {
      final res = await _dioClient.post(
        Endpoints.login,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
        data:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      );
      return RegisterResponseModel.fromJson(res);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future logoutRequest() async {
    try {
      final res = await _dioClient.post(Endpoints.logout);
      return res;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future forgotPasswordRequest({required String email}) async {
    try {
      final res = await _dioClient.post(
        Endpoints.forgotPassword,
        data: jsonEncode(
          <String, String>{'email': email},
        ),
      );
      return res;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<dynamic> resetPasswordRequest(
      {required String oldPassword, required String newPassword}) async {
    try {
      final res = await _dioClient.post(
        Endpoints.resetPassword,
        data: jsonEncode(
          <String, String>{
            'old_password': oldPassword,
            'new_password': newPassword,
          },
        ),
      );
      return res;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
