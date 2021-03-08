import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/normalTextField.dart';
import '../widgets/normalFormField.dart';
import '../widgets/dateField.dart';
import '../widgets/addCancelButtons.dart';

class AddVideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text('動画を追加'),
      ),
      body: Builder(
        builder: (context) => buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    DateFormat formatter = new DateFormat('yyyy-MM-dd');
    String today = formatter.format(DateTime.now());
    TextEditingController date = new TextEditingController(text: today);
    TextEditingController set = new TextEditingController();
    TextEditingController team = new TextEditingController();
    TextEditingController url = new TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          DateField(date,DateTime.now()),
          SizedBox(height: 20),
          NormalFormField('set', '例）4', set),
          SizedBox(height: 20),
          NormalTextField('team','例）芝浦工大', team),
          SizedBox(height: 20),
          NormalTextField('URL','https://google.com',url),
          SizedBox(height: 20),
          AddCancelButtons(date, set, team, url),
        ],
      ),
    );
  }
}
