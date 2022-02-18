import 'package:base_project_getx/data/encryption/mcrypt_base_64.dart';
import 'package:base_project_getx/data/network/repository/auth_repository.dart';
import 'package:base_project_getx/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // ------------- Variables -------------
  final isLogged = false.obs;

  // ----------------- Locators -----------------
  final sharedPrefHelper = Get.find<SharedPreferenceHelper>();
  final authRepository = Get.find<AuthRepository>();

  // ----------------- Methods -----------------
  Future<void> logOut() async {
    await authRepository.logoutRequest();
    isLogged.value = false;
    await sharedPrefHelper.clear();
  }

  Future<void> login(String email, String password) async {
    // Encrypting password before sending to server to avoid sending plain text password to server
    final encryptedPassword = MCryptBase64.encrypt(password);

    // Making login request to server with encrypted password and email
    final loginResponse = await authRepository
        .loginRequest(email, encryptedPassword)
        .catchError((error) {
      debugPrint("AuthController Login Error: $error");
    });

    // Checking if the login request was successful or not and saving the TOKEN in shared preferences and also updating the isLogged value in the UI
    if (loginResponse.token != null) {
      isLogged.value = true;
      await sharedPrefHelper.saveAuthToken(loginResponse.token!);
      await sharedPrefHelper.saveIsLoggedIn(isLogged.value);
    }
  }

  Future<void> register(String email, String password) async {
    // Making register request to server with encrypted password and email
    final registerResponse = await authRepository
        .registerRequest(email, password)
        .catchError((error) {
      debugPrint("AuthController Register Error: $error");
    });

    // Checking if the register request was successful or not and saving the TOKEN in shared preferences and also updating the isLogged value in the UI
    if (registerResponse.token != null) {
      isLogged.value = true;
      await sharedPrefHelper.saveAuthToken(registerResponse.token!);
      await sharedPrefHelper.saveIsLoggedIn(isLogged.value);
    }
  }

  // Forgot password
  void forgotPassword({required String email}) async {
    final res = await authRepository.forgotPassword(email: email);
  }

  // Reset password
  void resetPassword(
      {required String oldPassword, required String newPassword}) async {
    final res = await authRepository.resetPassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  void checkLoginStatus() {
    final String? token = sharedPrefHelper.authToken;
    if (token != null) {
      isLogged.value = true;
    }
  }

  // ----------------- Lifecycle -----------------
  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }
}
