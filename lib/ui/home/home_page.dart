import 'package:base_project_getx/constants/dimens.dart';
import 'package:base_project_getx/ui/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'title'.tr,
        ),
      ),
      body: GetX<HomeController>(
        initState: (state) async {
          await Get.find<HomeController>().getAll();
        },
        builder: (homeController) => homeController.postList.length > 1
            ? ScreenTypeLayout.builder(
                breakpoints: const ScreenBreakpoints(
                  tablet: Dimens.tabletScreenSize,
                  desktop: Dimens.desktopScreenSize,
                  watch: Dimens.mobileScreenSize,
                ),
                mobile: (BuildContext context) =>
                    _buildMobile(context, homeController),
                desktop: (BuildContext context) =>
                    _buildDesktop(context, homeController),
                tablet: (BuildContext context) =>
                    _buildTablet(context, homeController),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  _buildMobile(BuildContext context, HomeController homeController) {
    return Obx(() => ListView.builder(
          itemCount: homeController.postList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text(
                    homeController.postList[index].title ?? 'a',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  subtitle: Text(
                    homeController.postList[index].body ?? 'b',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
              ),
            );
          },
        ));
  }

  _buildTablet(BuildContext context, HomeController homeController) {
    return GridView.builder(
      itemCount: homeController.postList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              title: Text(
                homeController.postList[index].title ?? 'a',
                style: TextStyle(fontSize: 10.sp),
              ),
              subtitle: Text(
                homeController.postList[index].body ?? 'b',
                style: TextStyle(fontSize: 8.sp),
              ),
            ),
          ),
        );
      },
    );
  }

  _buildDesktop(BuildContext context, HomeController homeController) {
    return GridView.builder(
      itemCount: homeController.postList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              title: Text(
                homeController.postList[index].title ?? 'a',
                style: TextStyle(fontSize: 8.sp),
              ),
              subtitle: Text(
                homeController.postList[index].body ?? 'b',
                style: TextStyle(fontSize: 6.sp),
              ),
            ),
          ),
        );
      },
    );
  }
}
