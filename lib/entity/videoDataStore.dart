import 'package:cloud_firestore/cloud_firestore.dart';
import '../entity/video.dart';

class VideoDataStore{

  static String getCollectionPath(){
    return 'videos';
  }

  static String getDocumentPath(String documentId){
    return 'videos/$documentId';
  }

  static Future<void> addVideo(Video video)async{
    final newDocument = FirebaseFirestore.instance.collection(getCollectionPath()).doc();
    await newDocument.set(video.toMap());
  }

  static Future<Video> getVideo(String documentId)async{
    final snapshot = await FirebaseFirestore.instance.doc(getDocumentPath(documentId)).get();

    if(snapshot.exists){
      return Video.readMap(snapshot.data());
    }else{
      throw Error;
    }
  }

  static void delVideo(String documentId){
    FirebaseFirestore.instance.doc(getDocumentPath(documentId)).delete();
  }

  static void updateVideo(String documentId,Video video){
    FirebaseFirestore.instance.doc(getDocumentPath(documentId)).update({
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