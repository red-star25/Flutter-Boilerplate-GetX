import 'dart:async';

import 'package:base_project_getx/constants/app_theme.dart';
import 'package:base_project_getx/di/service_locator.dart';
import 'package:base_project_getx/utils/routes/pages.dart';
import 'package:base_project_getx/utils/routes/routes.dart';
import 'package:base_project_getx/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runZonedGuarded(() {
    service.SystemChrome.setPreferredOrientations(
        [service.DeviceOrientation.portraitUp]).then((_) {
      runApp(const MyApp());
    });
  }, (error, stackTrace) {
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        title: 'Getx Boilerplate',
        // initialRoute: Routes.ONBOARD,
        initialRoute: Routes.HOME,
        theme: themeData,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        translationsKeys: AppTranslation.translations,
      ),
    );
  }
}
