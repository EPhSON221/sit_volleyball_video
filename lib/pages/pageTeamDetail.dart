import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sit_volleyball_video/entity/teamOperation.dart';
import '../entity/team.dart';

class PageTeamDetail extends StatelessWidget {
  final DocumentSnapshot document;

  PageTeamDetail(this.document);

  @override
  Widget build(BuildContext context) {
    Team team = Team.readMap(document);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        centerTitle: true,
        title: Text(team.name),
        actions: [_delButton(context)],
      ),
      body: _buildBody(team),
    );
  }

  Widget _delButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {
        TeamOperation.delTeam(document.id);
        Navigator.pop(context);
      },
    );
  }

  Widget _buildBody(Team team) {
    return Column(
      children: [

      ],
    );
  }
}
