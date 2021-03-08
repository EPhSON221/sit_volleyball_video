import 'package:flutter/material.dart';
import '../widgets/buildVideoList.dart';

class VideoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text('動画'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/Add'),
          ),
        ],
      ),
      body: BuildVideoList(),
    );
  }
}

