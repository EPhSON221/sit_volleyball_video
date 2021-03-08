import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/normalTextField.dart';
import '../widgets/normalFormField.dart';
import '../widgets/dateField.dart';
import '../widgets/delUpdateButtons.dart';

class EditVideoList extends StatelessWidget{
  final DateTime date;
  final int set;
  final String team;
  final String url;
  final String docPath;

  EditVideoList(this.date,this.set,this.team,this.url,this.docPath);

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = new DateFormat('yyyy-MM-dd');
    String gameDate = formatter.format(date);
    TextEditingController dateController = new TextEditingController(text: gameDate);
    TextEditingController setController = new TextEditingController(text: '$set');
    TextEditingController teamController = new TextEditingController(text: team);
    TextEditingController urlController = new TextEditingController(text: url);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text('編集'),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            DateField(dateController,date),
            SizedBox(height: 20),
            NormalFormField('set', '例）4', setController),
            SizedBox(height: 20),
            NormalTextField('team','例）芝浦工大', teamController),
            SizedBox(height: 20),
            NormalTextField('URL','URL', urlController),
            SizedBox(height: 20),
            DelUpdateButtons(dateController, setController, teamController, urlController, docPath),
          ],
        ),
      ),
    );
  }
}
