import 'package:evenemento/core/style/style.dart';
import 'package:flutter/material.dart';

class MessengerHandler {
  static void showSnackBar(var scaffoldKey, String message) {
    scaffoldKey.currentState!.hideCurrentSnackBar();
    scaffoldKey.currentState!.showSnackBar(SnackBar(
        backgroundColor: AppTheme.cyanDarkTheme.colorScheme.primary,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black38),
        ),
        duration: const Duration(seconds: 2)));
  }
}
