import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/normalTextField.dart';
import '../widgets/normalFormField.dart';
import '../widgets/dateField.dart';
import '../widgets/addCancelButtons.dart';

class AddVideoPage extends StatelessWidget {
  final TextEditingController date = new TextEditingController();
  final TextEditingController set = new TextEditingController();
  final TextEditingController team = new TextEditingController();
  final TextEditingController url = new TextEditingController();
  final List<TextEditingController> controllerList = [];

  AddVideoPage() {
    DateFormat formatter = new DateFormat('yyyy-MM-dd');
    String today = formatter.format(DateTime.now());
    date.text = today;
    controllerList.add(date);
    controllerList.add(set);
    controllerList.add(team);
    controllerList.add(url);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text('動画を追加'),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          DateField(controllerList[0], DateTime.now()),
          SizedBox(height: 20),
          NormalFormField('set', '例）4', controllerList[1]),
          SizedBox(height: 20),
          NormalTextField('team', '例）芝浦工大', controllerList[2]),
          SizedBox(height: 20),
          NormalTextField('URL', 'https://google.com', controllerList[3]),
          SizedBox(height: 20),
          AddCancelButtons(controllerList),
        ],
      ),
    );
  }
}
