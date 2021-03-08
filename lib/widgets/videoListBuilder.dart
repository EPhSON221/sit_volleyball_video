import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/videoListTile.dart';


class VideoListBuilder extends StatelessWidget {
  final CollectionReference videos = FirebaseFirestore.instance.collection('videos');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: videos.orderBy('createdAt',descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text('Error: $snapshot.error');
        }
        switch (snapshot.connectionState) {

          case ConnectionState.waiting:
            return new Text('Loading...');

          default:
            return ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return VideoListCard(document);
              }).toList(),
            );
        }
      },
    );
  }
}
