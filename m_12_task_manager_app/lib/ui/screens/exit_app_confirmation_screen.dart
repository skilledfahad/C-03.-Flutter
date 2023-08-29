import 'package:flutter/material.dart';

  Future showExitConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text('Confirmation'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: [
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false); // Dismiss the dialog and return false
              },
            ),
            TextButton(
              child: const Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop(true); // Dismiss the dialog and return true
              },
            ),
          ],
        );
      },
    );
  }