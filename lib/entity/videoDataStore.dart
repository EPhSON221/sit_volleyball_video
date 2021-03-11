import 'package:cloud_firestore/cloud_firestore.dart';
import '../entity/video.dart';

class VideoDataStore{

  static Future<void> addVideo(Video video)async{
    final newDocument = FirebaseFirestore.instance.collection('videos').doc();
    await newDocument.set(video.toMap());
  }

  static void delVideo(String documentId){
    FirebaseFirestore.instance.doc('videos/$documentId').delete();
  }

  static void updateVideo(String documentId,Video video){
    FirebaseFirestore.instance.doc('videos/$documentId').update({
      VideoField.date: video.date,
      VideoField.set: video.set,
      VideoField.team: video.team,
      VideoField.url: video.url,
    });
  }

  static bool existBlank(Video video){
    bool date = video.date == null;
    bool set = video.set == null;
    bool team = video.team == '';
    bool url = video.url == '';

    if (date||set||team||url) return true;
    else  return false;
  }
}