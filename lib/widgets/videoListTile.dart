import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class VideoListTile extends StatefulWidget{
  final DocumentSnapshot document;
  final String title;

  VideoListTile(this.document,this.title);

  VideoListTileState createState() => VideoListTileState();
}


class VideoListTileState extends State<VideoListTile>{

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
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
          builder: null,
      )
    );
  }
}