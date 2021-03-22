import 'package:cloud_firestore/cloud_firestore.dart';
import 'team.dart';

class TeamOperation {
  static final teamCollection = FirebaseFirestore.instance.collection('team');

  static Future<void> addTeam(Team team)async{
    final newDocument = FirebaseFirestore.instance.collection('team').doc();
    await newDocument.set(team.toMap());
  }

  static void delTeam(String documentId){
    FirebaseFirestore.instance.doc('team/$documentId').delete();
  }

  static List<String> teamList() {
    Stream<QuerySnapshot> snapshot = teamCollection.snapshots();
    List<String> _teamList = [];
    snapshot.listen((snapshot) {
      snapshot.docs.forEach((doc) {
        Team team = Team.readMap(doc);
        _teamList.add(team.name);
      });
    });
    return _teamList;
  }

  static Stream<QuerySnapshot> teamStream(){
    CollectionReference reference = FirebaseFirestore.instance.collection('team');
    return reference.snapshots();
  }
}