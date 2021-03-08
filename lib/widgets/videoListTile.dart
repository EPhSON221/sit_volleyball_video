import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sit_volleyball_video/urlFormat.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/pageEditVideoList.dart';
import '../entity/video.dart';
import '../dialogs/normalAlertDialog.dart';


class VideoListCard extends StatefulWidget{
  final DocumentSnapshot document;

  VideoListCard(this.document);

  VideoListCardState createState() => VideoListCardState();
}


class VideoListCardState extends State<VideoListCard>{

  @override
  Widget build(BuildContext context) {
    final Video video = new Video.readDoc(widget.document);
    String imgURL = UrlFormatter(video.url).imageFormat();

    return Card(
      child: InkWell(
        onTap: () => onCardTapped(video,context),
        child: cardLayOut(video,imgURL),
      ),
    );
  }

  Widget cardLayOut(Video video,String url){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(6.0),
            child: Image.network(url),
          ),
          titleBuilder(video),
          buttonGoEditPage(),
        ],
      ),
    );
  }

  Widget titleBuilder(Video video){
    List<String> list = video.toList();
    return Column(
      children: [
        Text('${list[0]}'),
        Text('${list[1]}セット目 vs${list[2]}'),
      ],
    );
  }

  Widget buttonGoEditPage(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: onButtonPressed,
        ),
      ],
    );
  }

  void onButtonPressed(){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditVideoList(widget.document),
      )
    );
  }

  Future onCardTapped(Video video,BuildContext context)async{
    if(await canLaunch(video.url)){
      await launch(video.url);
    }else{
      NormalAlertDialog('URLが間違っています',context);
    }
  }
}
