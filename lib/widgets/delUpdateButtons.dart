import 'package:flutter/material.dart';
import '../entity/video.dart';
import '../entity/videoDataStore.dart';
import '../dialogs/existBlankDialog.dart';

class DelUpdateButtons extends StatelessWidget{
  final TextEditingController date;
  final TextEditingController set;
  final TextEditingController team;
  final TextEditingController url;
  final String docPath;

  DelUpdateButtons(this.date,this.set,this.team,this.url,this.docPath);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DellButton(docPath),
        UpdateButton(date, set, team, url, docPath),
      ],
    );
  }
}

class DellButton extends StatelessWidget{
  final String docPath;

  DellButton(this.docPath);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: RaisedButton(
        child: Text('削除する'),
        color: Colors.green.shade100,
        onPressed: () {
          VideoDataStore.delVideo(docPath);
          Navigator.pop(context);
        },
      ),
    );
  }
}

class UpdateButton extends StatelessWidget{
  final TextEditingController date;
  final TextEditingController set;
  final TextEditingController team;
  final TextEditingController url;
  final String docPath;

  UpdateButton(this.date,this.set,this.team,this.url,this.docPath);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: RaisedButton(
        child: Text('更新'),
        color: Colors.green.shade100,
        onPressed: () {
          final video = Video();
          video.date = DateTime.parse(date.text);
          video.set = int.parse(set.text);
          video.team = team.text;
          video.url = url.text;
          if(VideoDataStore.existBlank(video)){
            ExistBlankDialog(context);
          }else{
            VideoDataStore.updateVideo(docPath, video);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

