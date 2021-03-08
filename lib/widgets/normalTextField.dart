import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  NormalTextField(this.label,this.hint,this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        hintText: hint,
      ),
    );
  }
}