import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red.withOpacity(0.9),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ));

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackbar(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.green.withOpacity(0.9),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ));

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showBusyIndicator(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      content: Container(
        width: 100,
        height: 100,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (_) => dialog,
    );
  }
}
