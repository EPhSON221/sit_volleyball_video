import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sit_volleyball_video/entity/video.dart';
import '../pages/pageEditVideoInfo.dart';
import '../url.dart';

class PageVideoDetails extends StatelessWidget{
  final DocumentSnapshot document;

  PageVideoDetails(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          goEditPageIcon(context),
        ],
        backgroundColor: Colors.green.shade900,
      ),
      body: buildBody(),
    );
  }

  Widget goEditPageIcon(BuildContext context){
    return IconButton(
      icon: Icon(Icons.more_horiz),
      onPressed: () => onIconPressed(context),
    );
  }

  void onIconPressed(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditVideoInfo(document),
      ),
    );
  }

  Widget buildBody(){
    String url = document[VideoField.url];
    String imgURL = URL.imageFormat(url).url;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Image.network(imgURL),
        ),
      ],
    );
  }
}