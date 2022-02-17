import 'package:base_project_getx/ui/home/binding.dart';
import 'package:base_project_getx/ui/home/home_page.dart';
import 'package:base_project_getx/utils/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
