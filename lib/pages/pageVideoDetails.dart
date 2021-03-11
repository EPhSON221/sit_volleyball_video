import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../entity/video.dart';
import '../pages/pageEditVideoInfo.dart';

class PageVideoDetails extends StatelessWidget{
  final DocumentSnapshot document;

  PageVideoDetails(this.document);

  @override
  Widget build(BuildContext context) {
    Video video = Video.readDoc(document);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: video.getTitle(),
        centerTitle: true,
        actions: [_iconButton(context)],
      ),
      body: _buildBody(video,context),
    );
  }

  Widget _iconButton(BuildContext context){
    return IconButton(
      icon: Icon(Icons.more_horiz),
      onPressed: () => _onIconPressed(context),
    );
  }

  void _onIconPressed(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageEditVideoInfo(document),
      ),
    );
  }

  Widget _buildBody(Video video,BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: video.getThumbnail(),
        ),
      ],
    );
  }
}