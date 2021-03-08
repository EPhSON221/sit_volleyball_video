import 'package:flutter/material.dart';

class GeneralAlertDialog {
  final String alert;
  final BuildContext context;

  GeneralAlertDialog(this.alert,this.context) {
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