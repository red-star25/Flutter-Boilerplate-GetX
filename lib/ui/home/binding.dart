import 'package:base_project_getx/ui/home/controller.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
