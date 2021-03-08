import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Video{
  DateTime date;
  int set;
  String team;
  String url;
  Timestamp createdAt = Timestamp.fromDate(DateTime.now());
  DateFormat formatter = new DateFormat('yyyy-MM-dd');

  Video({this.date,this.set,this.team,this.url});

  Video.readMap(Map<String,dynamic> map){
    this.date = map[VideoField.date].toDate();
    this.set = map[VideoField.set];
    this.team = map[VideoField.team];
    this.url = map[VideoField.url];
  }

  Video.readDoc(DocumentSnapshot doc){
    this.date = doc[VideoField.date];
    this.set = doc[VideoField.set];
    this.team = doc[VideoField.team];
    this.url = doc[VideoField.url];
  }

  Video.readController(List list){
    this.date = DateTime.parse(list[0].text);
    this.set = int.parse(list[1].text);
    this.team = list[2].text;
    this.url = list[3].text;
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

  List<String> toList(){
    List<String> list = [];
    list.add(formatter.format(date));
    list.add('$set');
    list.add(team);
    list.add(url);
    return list;
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