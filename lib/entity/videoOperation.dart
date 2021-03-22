import 'package:cloud_firestore/cloud_firestore.dart';
import '../entity/video.dart';

class VideoOperation{

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

  static Stream<QuerySnapshot> videoStream({String order,String where}){
    CollectionReference reference = FirebaseFirestore.instance.collection('videos');
    return reference
        .where(VideoField.team,isEqualTo: where)
        .orderBy(order,descending: true)
        .orderBy(VideoField.set,descending: true)
        .snapshots();
  }
}