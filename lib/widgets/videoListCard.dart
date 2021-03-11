import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../url.dart';
import '../pages/pageVideoDetails.dart';
import '../entity/video.dart';


class VideoCard extends StatefulWidget{
  final DocumentSnapshot document;

  VideoCard(this.document);

  VideoCardState createState() => VideoCardState();
}

class VideoCardState extends State<VideoCard>{
  Image image;
  Column title;

  @override
  void initState() {
    print('initState');
    super.initState();
    _setCard();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Card(
      child: InkWell(
        onTap: null,
        child: Row(
          children: [
            Expanded(child: image),
            Expanded(child: title),
          ],
        ),
      ),
    );
  }

  Future<void> _setCard()async{
    Video video = new Video.readDoc(widget.document);
    String imgURL = URL.imageFormat(video.url);
    if(await URL.isCollect(imgURL)){
      this.title = video.getTitle();
      this.image = Image.network(imgURL);
    }else{
      this.title = video.getTitle();
      this.image = Image.asset('images/wrongURL.png');
    }
  }
}


class VideoListCard extends StatelessWidget{
  final DocumentSnapshot document;

  VideoListCard(this.document);

  @override
  Widget build(BuildContext context) {
    final Video video = new Video.readDoc(document);

    return Card(
      child: InkWell(
        child: _cardLayOut(video),
        onTap: () => _onCardTapped(context),
      ),
    );
  }

  Widget _cardLayOut(Video video){
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _image(video),
          _title(video),
        ],
      ),
    );
  }
  
  Widget _image(Video video){
    return Expanded(
      flex: 2,
      child: video.getThumbnail(),
    );
  }

  Widget _title(Video video){
    return Expanded(
      flex: 3,
      child: video.getTitle(),
    );
  }

  void _onCardTapped(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageVideoDetails(document),
      ),
    );
  }
}
