import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade900,
        title: Text('芝浦工業大学 バレーボール部'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.video_collection),
            title: Text('動画'),
            onTap: () => Navigator.pushNamed(context, '/Video'),
          ),
        ],
      ),
    );
  }
}
