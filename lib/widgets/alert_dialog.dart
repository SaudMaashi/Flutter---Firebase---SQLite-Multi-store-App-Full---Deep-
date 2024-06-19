import 'package:flutter/cupertino.dart';

class MyAlertDialog {
  static void showMyDialog({
    required BuildContext context,
    required String title,
    required String content,
    required Function() tapNo,
    required Function() tapYes,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            CupertinoDialogAction(
              onPressed: tapNo,
              child: const Text("No"),
            ),
            CupertinoDialogAction(
              onPressed: tapYes,
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
