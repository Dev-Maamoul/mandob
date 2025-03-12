import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showSuccessDialog({
  required BuildContext context,
  required bool isDone,
  String? message,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Column(
          children: [
            Icon(
              isDone ? Icons.check_circle : Icons.warning,
              color: isDone ? Colors.green : Colors.red,
              size: 50,
            ),
            SizedBox(height: 10),
            Text(
              isDone ? "Successful" : "Oh there Error",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Text(
          isDone
              ? "All drivers has been successfully added."
              : "Sorry, $message",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDone ? Colors.green : Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Navigator.of(context).pop(); // Close dialog
                context.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text("OK", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      );
    },
  );
}
