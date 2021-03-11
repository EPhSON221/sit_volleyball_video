import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_volleyball_video/pages/pageEditVideoInfo.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/pageVideoDetails.dart';
import '../entity/video.dart';

class VideoListCard extends StatelessWidget {
  final DocumentSnapshot document;

  VideoListCard(this.document);

  @override
  Widget build(BuildContext context) {
    final Video video = new Video.readDoc(document);

    return Card(
      child: InkWell(
        child: _cardLayOut(video,context),
        onTap: () => _onCardTapped(video, context),
      ),
    );
  }

  Widget _cardLayOut(Video video,BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _image(video),
          _title(video),
          _icon(context),
        ],
      ),
    );
  }

  Widget _image(Video video) {
    return Expanded(
      flex: 2,
      child: video.getThumbnail(),
    );
  }

  Widget _title(Video video) {
    return Expanded(
      flex: 3,
      child: video.getTitle(),
    );
  }

  Widget _icon(BuildContext context) {
    return IconButton(
      onPressed: () => _onIconPressed(context),
      icon: Icon(Icons.more_horiz),
    );
  }

  Future<void> _onCardTapped(Video video, BuildContext context) async {
    if (await canLaunch(video.url)) await launch(video.url);
    else                            _wrongURL(context);
  }

  void _wrongURL(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageVideoDetails(document),
      ),
    );
  }

  void _onIconPressed(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageEditVideoInfo(document),
      )
    );
  }
}
