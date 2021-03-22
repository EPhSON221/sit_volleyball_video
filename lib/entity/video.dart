import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../url.dart';

class Video{
  DateTime date;
  int set;
  String team;
  String url;
  DateFormat formatter = new DateFormat('yyyy/MM/dd');

  Video.readDoc(DocumentSnapshot doc){
    this.date = doc[VideoField.date].toDate();
    this.set = doc[VideoField.set];
    this.team = doc[VideoField.team];
    this.url = doc[VideoField.url];
  }

  Video.readController(List list){
    this.date = DateTime.parse(list[0].text);
    this.set = int.parse(list[1].text);
    this.team = list[2].text;
    this.url = list[3].text;
    this.url = URL.inputFormat(url);
  }

  Map<String,dynamic> toMap(){
    return {
      VideoField.date: this.date,
      VideoField.set: this.set,
      VideoField.team: this.team,
      VideoField.url: this.url,
    };
  }

  bool existBlank(){
    bool date = this.date == null;
    bool set = this.set == null;
    bool team = this.team == '';
    bool url = this.url == '';

    if (date||set||team||url) return true;
    else  return false;
  }

  Widget getTitle(){
    return Column(
      children: [
        Text('${formatter.format(date)}'),
        Text('vs$team $setセット目'),
      ],
    );
  }

  Widget getThumbnail(){
    String imgURL = URL.imageFormat(url);
    if(imgURL == 'wrong') return Image.asset('images/wrongURL.png');
    else return Image.network(imgURL);
  }
}

class VideoField{
  static const date = 'date';
  static const set = 'set';
  static const team = 'team';
  static const url = 'url';
}