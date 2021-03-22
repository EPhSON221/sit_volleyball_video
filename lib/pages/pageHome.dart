import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade900,
        title: Text('芝浦工業大学 バレーボール部'),
      ),
      body: _buildBody(context),
    );
  }
  
  Widget _buildBody(BuildContext context){
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.video_collection),
          title: Text('動画'),
          onTap: () => Navigator.pushNamed(context, '/VideoList'),
        ),
        ListTile(
          leading: Icon(Icons.paste),
          title: Text('チーム'),
          onTap: () => Navigator.pushNamed(context, '/TeamList'),
        )
      ],
    );
  }
}
