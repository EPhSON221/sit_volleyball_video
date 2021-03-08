import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../pages/pageEditVideoList.dart';
import '../entity/video.dart';


class VideoListTile extends StatefulWidget{
  final DocumentSnapshot document;

  VideoListTile(this.document);

  VideoListTileState createState() => VideoListTileState();
}


class VideoListTileState extends State<VideoListTile>{
  @override
  Widget build(BuildContext context) {
    final Video video = new Video.readDoc(widget.document);

    return ListTile(
      title: Text(''),
      trailing: buttonGoEditPage(),
    );
  }

  Widget buttonGoEditPage(){
    return IconButton(
      icon: Icon(Icons.more_horiz),
      onPressed: onIconPressed,
    );
  }

  void onIconPressed(){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditVideoList(widget.document),
      )
    );
  }
}
