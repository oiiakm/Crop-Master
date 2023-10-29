import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageDisplay {
  static void showMessage(String message) {
    Get.snackbar(
      "Notification",
      message, 
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.blue,
      snackPosition: SnackPosition.TOP, 
      margin: const EdgeInsets.all(10.0),
      borderRadius: 10.0, 
      isDismissible: true, 
    );
  }
}

