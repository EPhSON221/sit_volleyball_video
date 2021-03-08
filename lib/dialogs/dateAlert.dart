import 'package:flutter/material.dart';

class DateAlert {
  final BuildContext context;

  DateAlert(this.context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('半角で2000-01-01のように入力してください'),
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