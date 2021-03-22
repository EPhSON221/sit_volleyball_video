import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../entity/videoOperation.dart';
import '../entity/teamOperation.dart';
import 'videoCard.dart';
import 'teamCard.dart';


class ListBuilder{
  static String sortBy = 'date';
  static String team = '芝浦工大';

  static Widget videoList(){
    return StreamBuilder(
        stream: VideoOperation.videoStream(order: sortBy,where: team),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return _videoBuilder(context, snapshot);
        }
    );
  }

  static Widget teamList(){
    return StreamBuilder(
        stream: TeamOperation.teamStream(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return _teamBuilder(context, snapshot);
        }
    );
  }

  static Widget _videoBuilder(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){

    if(snapshot.hasError) return Text('Error: $snapshot.error');

    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return new Text('Loading...');
      default:
        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return VideoCard(document);
          }).toList(),
        );
    }
  }

  static Widget _teamBuilder(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
    if(snapshot.hasError) return Text('Error: $snapshot.error');

    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return new Text('Loading...');
      default:
        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return TeamCard(document);
          }).toList(),
        );
    }
  }
}