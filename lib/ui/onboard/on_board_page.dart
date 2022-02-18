import 'package:base_project_getx/ui/auth/controller.dart';
import 'package:base_project_getx/ui/auth/login/login_page.dart';
import 'package:base_project_getx/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();
    return Obx(() {
      if (!_authController.isLogged.value) {
        return const LoginPage();
      } else {
        return const HomePage();
      }
    });
  }
}
