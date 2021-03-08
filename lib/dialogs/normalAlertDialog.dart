import 'package:flutter/material.dart';

class NormalAlertDialog {
  final String alert;
  final BuildContext context;

  NormalAlertDialog(this.alert,this.context) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(alert),
            actions: [
              TextButton(
                child: Text('ok'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        }
    );
  }
}