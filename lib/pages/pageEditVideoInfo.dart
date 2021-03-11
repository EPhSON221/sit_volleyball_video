import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../dialogs/deleteVideoDialog.dart';
import '../entity/video.dart';
import '../widgets/normalTextField.dart';
import '../widgets/normalFormField.dart';
import '../widgets/dateField.dart';
import '../widgets/buttonUpdate.dart';

class PageEditVideoInfo extends StatelessWidget {
  final TextEditingController date = new TextEditingController();
  final TextEditingController set = new TextEditingController();
  final TextEditingController team = new TextEditingController();
  final TextEditingController url = new TextEditingController();
  final List<TextEditingController> controllerList = [];
  final DocumentSnapshot document;
  final DateFormat formatter = new DateFormat('yyyy-MM-dd');

  PageEditVideoInfo(this.document) {
    DateTime dateTime = document[VideoField.date].toDate();
    date.text = formatter.format(dateTime);
    set.text = '${document[VideoField.set]}';
    team.text = document[VideoField.team];
    url.text = document[VideoField.url];
    controllerList.add(date);
    controllerList.add(set);
    controllerList.add(team);
    controllerList.add(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text('編集'),
        actions: [_iconButton(context)],
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            DateField(date, document['date'].toDate()),
            SizedBox(height: 20),
            NormalFormField('set', '例）4', set),
            SizedBox(height: 20),
            NormalTextField('team', '例）芝浦工大', team),
            SizedBox(height: 20),
            NormalTextField('URL', 'URL', url),
            SizedBox(height: 20),
            ButtonUpdate(document.id, controllerList),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: () => DeleteVideoDialog(document.id, context),
    );
  }
}
