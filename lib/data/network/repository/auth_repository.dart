import 'package:base_project_getx/data/models/auth/login_response_model.dart';
import 'package:base_project_getx/data/models/auth/register_response_model.dart';
import 'package:base_project_getx/data/network/apis/auth/auth_api.dart';

class AuthRepository {
  final AuthApi authApi;

  AuthRepository({required this.authApi});

  Future<LoginResponseModel> loginRequest(String email, String password) async {
    return await authApi
        .loginRequest(email: email, password: password)
        .then((loginResponse) {
      return loginResponse;
    }).catchError((error) => throw error);
  }

  Future<RegisterResponseModel> registerRequest(
      String email, String password) async {
    return await authApi
        .registerRequest(email: email, password: password)
        .then((registerResponse) {
      return registerResponse;
    }).catchError((error) => throw error);
  }

  Future logoutRequest() async {
    return await authApi.logoutRequest().then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  Future forgotPassword({required String email}) async {
    return await authApi.forgotPasswordRequest(email: email).then(
      (res) {
        return res;
      },
    ).catchError(
      (error) => throw error,
    );
  }

  Future resetPassword(
      {required String oldPassword, required String newPassword}) async {
    return await authApi
        .resetPasswordRequest(
      newPassword: newPassword,
      oldPassword: oldPassword,
    )
        .then(
      (res) {
        return res;
      },
    ).catchError(
      (error) => throw error,
    );
  }
}
