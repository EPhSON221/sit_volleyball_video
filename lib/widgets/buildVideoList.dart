import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/pageEditVideoList.dart';
import '../dialogs/normalAlertDialog.dart';

class BuildVideoList extends StatelessWidget {
  final CollectionReference videos = FirebaseFirestore.instance.collection('videos');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: videos.orderBy('createdAt',descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error: $snapshot.error');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                DateTime dateTime = document['date'].toDate();
                DateFormat formatter = new DateFormat('yyyy-MM-dd');
                String date = formatter.format(dateTime);
                int set = document['set'];
                String team = document['team'];
                String url = document['url'];
                String title = '$date $setセット目 vs$team';
                return ListTile(
                  title: Text(title),
                  onTap: () async {
                    if (await canLaunch(url)) {
                      await launch(url);
                    }else{
                      GeneralAlertDialog('URLが間違っています',context);
                    }
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditVideoList(document),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
