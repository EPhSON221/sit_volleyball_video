import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DateField extends StatefulWidget {
  final TextEditingController controller;
  DateTime dateTime;

  DateField(this.controller,this.dateTime);

  DateFieldState createState() => DateFieldState();
}

class DateFieldState extends State<DateField> {
  DateFormat formatter = new DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: decoration(),
      onTap: onTapped,
    );
  }

  InputDecoration decoration(){
    return InputDecoration(
      labelText: 'date',
      border: OutlineInputBorder(),
    );
  }

  void onTapped(){
    FocusScope.of(context).requestFocus(new FocusNode());
    selectDate(context);
  }

  Future<Null> selectDate(BuildContext context) async {

    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.dateTime,
      firstDate: new DateTime(2018),
      lastDate: new DateTime.now().add(new Duration(days: 360)),
    );

    if(pickedDate != null) {
      setState(() => widget.dateTime = pickedDate);
      widget.controller.text = formatter.format(widget.dateTime);
    }
  }

}