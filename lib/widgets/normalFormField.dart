import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NormalFormField extends StatelessWidget{
  final String label;
  final String hint;
  final TextEditingController controller;

  NormalFormField(this.label,this.hint,this.controller);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(),
      ),
    );
  }
}