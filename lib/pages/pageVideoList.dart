import 'package:flutter/material.dart';
import '../widgets/dropDownButton.dart';
import '../widgets/listBuilder.dart';

class PageVideoList extends StatefulWidget {
  PageVideoState createState() => PageVideoState();
}

class PageVideoState extends State<PageVideoList>{
  String sortBy = 'createdAt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text('動画'),
        actions: [
          SortButton(),
          _reloadButton(context),
          _iconButton(context),
        ],
      ),
      body: ListBuilder.videoList(),
    );
  }

  Widget _reloadButton(BuildContext context){
    return IconButton(
      icon: Icon(Icons.refresh),
      onPressed: () => setState((){ListBuilder.team = SortButtonState.dropdownValue;}),
    );
  }

  Widget _iconButton(BuildContext context){
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, '/AddVideo'),
    );
  }
}

