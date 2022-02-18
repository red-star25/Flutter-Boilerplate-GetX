import 'package:base_project_getx/ui/auth/bindings.dart';
import 'package:base_project_getx/ui/auth/forgot_password/forgot_password_page.dart';
import 'package:base_project_getx/ui/auth/login/login_page.dart';
import 'package:base_project_getx/ui/auth/register/register_page.dart';
import 'package:base_project_getx/ui/auth/reset_password/reset_password_page.dart';
import 'package:base_project_getx/ui/home/binding.dart';
import 'package:base_project_getx/ui/home/home_page.dart';
import 'package:base_project_getx/ui/onboard/on_board_page.dart';
import 'package:base_project_getx/utils/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => ResetPasswordPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.ONBOARD,
      page: () => const OnBoard(),
    ),
  ];
}
