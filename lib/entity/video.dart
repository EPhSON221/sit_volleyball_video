import 'package:cloud_firestore/cloud_firestore.dart';

class Video{
  DateTime date;
  int set;
  String team;
  String url;
  Timestamp createdAt = Timestamp.fromDate(DateTime.now());

  Video({this.date,this.set,this.team,this.url});

  Video.readMap(Map<String,dynamic> map){
    this.date = map[VideoField.date].toDate();
    this.set = map[VideoField.set];
    this.team = map[VideoField.team];
    this.url = map[VideoField.url];
  }

  Map<String,dynamic> toMap(){
    return {
      VideoField.date: this.date,
      VideoField.set: this.set,
      VideoField.team: this.team,
      VideoField.url: this.url,
      VideoField.createdAt: this.createdAt,
    };
  }
}

class VideoField{
  static const date = 'date';
  static const set = 'set';
  static const team = 'team';
  static const url = 'url';
  static const createdAt = 'createdAt';
}

class VideoDocument{
  String documentId;
  Video video;

  VideoDocument(this.documentId,this.video);
}