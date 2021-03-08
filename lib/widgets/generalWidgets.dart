import 'package:flutter/material.dart';

class GeneralTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  GeneralTextField(this.hint,this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hint,
        hintText: hint,
      ),
    );
  }
}

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
