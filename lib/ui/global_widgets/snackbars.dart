import 'package:base_project_getx/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void openPrimarySnackBar({
    required BuildContext context,
    required String title,
    required String subtitle,
    Color? color,
    double? bordeRadius,
    EdgeInsets? margin,
    SnackStyle? snackStyle,
    SnackPosition? snackPosition,
  }) {
    // This should be called by an on pressed function
    Get.snackbar(
      title,
      subtitle,
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      backgroundColor: color ?? Colors.blueAccent,
      borderRadius: bordeRadius ?? 8,
      margin: margin ?? const EdgeInsets.all(8),
      snackStyle: snackStyle ?? SnackStyle.FLOATING,
    );
  }

  static void openErrorSnackBar(
      {required BuildContext context,
      required String errorText,
      Color? color,
      double? bordeRadius,
      EdgeInsets? margin,
      SnackStyle? snackStyle,
      SnackPosition? snackPosition,
      Widget? icon}) {
    // This should be called by an on pressed function
    Get.snackbar(
      Strings.errorLabel,
      errorText,
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      backgroundColor: color ?? Colors.blueAccent,
      borderRadius: bordeRadius ?? 8,
      margin: margin ?? const EdgeInsets.all(8),
      snackStyle: snackStyle ?? SnackStyle.FLOATING,
      icon: icon,
    );
  }

  static void openIconSnackBar(
      {required BuildContext context,
      required String title,
      required String subtitle,
      Color? color,
      double? bordeRadius,
      EdgeInsets? margin,
      SnackStyle? snackStyle,
      SnackPosition? snackPosition,
      Widget? icon}) {
    // This should be called by an on pressed function
    Get.snackbar(
      title,
      subtitle,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blueAccent,
      borderRadius: 8,
      margin: const EdgeInsets.all(8),
      snackStyle: SnackStyle.FLOATING,
      icon: icon,
    );
  }

  static void openWarningSnackBar(
      context,
      String text,
      Color? color,
      double? bordeRadius,
      EdgeInsets? margin,
      SnackStyle? snackStyle,
      SnackPosition? snackPosition,
      Widget icon) {
    // This should be called by an on pressed function
    Get.snackbar(Strings.warningLabel, text,
        snackPosition: snackPosition ?? SnackPosition.BOTTOM,
        backgroundColor: color ?? Colors.orangeAccent,
        borderRadius: bordeRadius ?? 8,
        margin: margin ?? const EdgeInsets.all(8),
        snackStyle: snackStyle ?? SnackStyle.FLOATING,
        icon: icon);
  }
}
