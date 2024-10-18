import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarWidgets {
  static void snackBar(
    String title,
    String message, {
    Duration? duration = const Duration(seconds: 2),
    SnackPosition? snackPosition,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
    bool? isDismissible,
    DismissDirection? dismissDirection = DismissDirection.up,
    Color? colorText,
  }) {
    
    Get.snackbar(
      title,
      message,
      snackPosition: snackPosition,
      duration: duration,
      margin: margin,
      padding: padding,
      backgroundColor: backgroundColor,
      colorText: colorText,
      isDismissible: true,
      dismissDirection: dismissDirection,
    );
  }
}
