import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/pageEditVideoList.dart';
import '../entity/video.dart';
import '../dialogs/normalAlertDialog.dart';


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
      title: titleBuilder(video),
      trailing: buttonGoEditPage(),
      onTap: () => onTileTapped(video,context),
    );
  }

  Widget titleBuilder(Video video){
    List<String> list = video.toList();
    return Text('${list[0]} ${list[1]}セット目 vs${list[2]}');
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

  Future onTileTapped(Video video,BuildContext context)async{
    if(await canLaunch(video.url)){
      await launch(video.url);
    }else{
      NormalAlertDialog('URLが間違っています',context);
    }
  }
}
