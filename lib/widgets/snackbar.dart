import 'package:flutter/material.dart';

class MyMessageHandler {
  static void showSnackBar(var scaffoldKey, String message) {
    scaffoldKey.currentState!.hideCurrentSnackBar();
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.yellow,
        content: Center(
          child: Text(
            message,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
