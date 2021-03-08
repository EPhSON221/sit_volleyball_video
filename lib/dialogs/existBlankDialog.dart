import 'package:flutter/material.dart';

class ExistBlankDialog {
  final BuildContext context;

  ExistBlankDialog(this.context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('空欄なく入力して下さい'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('ok'),
            ),
          ],
        );
      },
    );
  }
}