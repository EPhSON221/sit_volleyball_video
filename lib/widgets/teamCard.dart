import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../pages/pageTeamDetail.dart';
import '../entity/team.dart';

class TeamCard extends StatelessWidget{
  final DocumentSnapshot document;
  
  TeamCard(this.document);

  @override
  Widget build(BuildContext context) {
    Team team = Team.readMap(document);
    return Card(
      child: InkWell(
        child: _cardLayout(team),
        onTap: () => _onCardTapped(context),
      ),
    );
  }
  
  Widget _cardLayout(Team team){
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(team.name),
        ],
      ),
    );
  }

  void _onCardTapped(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
         builder: (context) => PageTeamDetail(document)
      )
    );
  }
}