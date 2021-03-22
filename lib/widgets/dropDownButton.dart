import 'package:flutter/material.dart';
import '../entity/teamOperation.dart';

class SortButton extends StatefulWidget {
  SortButtonState createState() => SortButtonState();
}

class SortButtonState extends State<SortButton> {
  List<String> teamList = TeamOperation.teamList();
  static String dropdownValue;

  @override
  void initState() {
    setState(() => dropdownValue = '芝浦工大');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Colors.grey,
      iconEnabledColor: Colors.white,
      iconDisabledColor:Colors.white,
      items: _itemList(),
      value: dropdownValue,
      onChanged: (String newValue) {
        setState(() => dropdownValue = newValue);
      }
    );
  }

  List<DropdownMenuItem<String>> _itemList() {
    List<DropdownMenuItem<String>> itemList = List();
    teamList.forEach((value) => itemList.add(_item(value)));
    return itemList;
  }

  DropdownMenuItem<String> _item(String value) {
    return DropdownMenuItem(
      child: Text(
        value,
        style: TextStyle(
          color: Colors.white
        ),
      ),
      value: value,
    );
  }
}
