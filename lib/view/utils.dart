import 'package:flutter/material.dart';

class Utils {
  static final messangerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String text, status) {
    if (text.isEmpty) {
      return;
    }

    final snackBarSuccess = SnackBar(
      content: Text(text),
      backgroundColor: const Color.fromARGB(221, 76, 175, 79),
      duration: const Duration(seconds: 3),
    );
    final snackBarError = SnackBar(
      content: Text(text),
      backgroundColor: const Color.fromARGB(207, 244, 67, 54),
      duration: const Duration(seconds: 3),
    );

    messangerKey.currentState
        ?.showSnackBar(status == true ? snackBarSuccess : snackBarError);
  }
}
