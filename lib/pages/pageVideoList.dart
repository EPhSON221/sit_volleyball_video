import 'package:flutter/material.dart';
import '../widgets/videoListBuilder.dart';

class PageVideoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text('動画'),
        actions: [_iconButton(context)],
      ),
      body: VideoListBuilder(),
    );
  }

  Widget _iconButton(BuildContext context){
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, '/AddVideo'),
    );
  }
}

