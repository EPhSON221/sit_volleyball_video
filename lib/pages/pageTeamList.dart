import 'package:flutter/material.dart';
import 'package:sit_volleyball_video/pages/pageAddTeam.dart';
import '../widgets/listBuilder.dart';

class PageTeamList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade900,
        title: Text('チーム一覧'),
        actions: [_iconButton(context)],
      ),
      body: ListBuilder.teamList(),
    );
  }

  Widget _iconButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () => _onIconPressed(context),
    );
  }

  void _onIconPressed(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageAddTeam()
      )
    );
  }
}
