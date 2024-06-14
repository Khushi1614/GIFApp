import 'package:flutter/material.dart';
import 'package:get/get.dart';

void CustomSnackBar(String message, {bool isError = false}) {
  if (message != null && message.isNotEmpty) {
    final snackBar = SnackBar(
      backgroundColor: isError ? Colors.green : Colors.red,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      content: Text(message.toString()),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
