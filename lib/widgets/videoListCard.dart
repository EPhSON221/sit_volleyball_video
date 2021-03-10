import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../url.dart';
import '../pages/pageVideoDetails.dart';
import '../pages/pageEditVideoInfo.dart';
import '../entity/video.dart';


class VideoListCard extends StatelessWidget{
  final DocumentSnapshot document;

  VideoListCard(this.document);

  @override
  Widget build(BuildContext context) {
    final Video video = new Video.readDoc(document);
    String imgURL = URL.imageFormat(video.url).url;

    return Card(
      child: InkWell(
        onTap: () => onCardTapped(video,context),
        child: cardLayOut(video,imgURL,context),
      ),
    );
  }

  Widget cardLayOut(Video video,String url,context){
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          image(url),
          title(video),
          button(context),
        ],
      ),
    );
  }
  
  Widget image(String url){
    return Expanded(
      flex: 2,
      child: Image.network(url),
    );
  }

  Widget title(Video video){
    List<String> list = video.toList();
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          Text('${list[0]}'),
          Text('${list[1]}セット目 vs${list[2]}'),
        ],
      ),
    );
  }

  Widget button(context){
    return IconButton(
      icon: Icon(Icons.more_horiz),
      onPressed: () => onButtonPressed(context),
    );
  }

  void onButtonPressed(context){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditVideoInfo(document),
      )
    );
  }

  Future<void> onCardTapped(Video video,BuildContext context)async{
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageVideoDetails(document),
      ),
    );
  }
}
