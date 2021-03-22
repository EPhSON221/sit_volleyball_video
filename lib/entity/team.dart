import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Team{
  String name;
  String twitter;
  String instagram;
  String hp;

  Team.readMap(DocumentSnapshot doc){
    this.name = doc['name'];
    this.twitter = doc['twitter'];
    this.instagram = doc['instagram'];
    this.hp = doc['hp'];
  }
  Team.readController(List<TextEditingController> list){
    this.name = list[0].text;
    this.twitter = list[1].text;
    this.instagram = list[2].text;
    this.hp = list[3].text;
  }

  Map<String,dynamic> toMap(){
    return {
      'name': this.name,
      'twitter': this.twitter,
      'instagram': this.instagram,
      'hp': this.hp,
    };
  }
}

class TeamField{
  static const name = 'name';
  static const twitter = 'twitter';
  static const instagram = 'instagram';
  static const hp = 'hp';
}