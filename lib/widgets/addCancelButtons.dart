import 'package:flutter/material.dart';
import '../entity/video.dart';
import '../entity/videoDataStore.dart';
import '../dialogs/existBlankDialog.dart';

// ignore: must_be_immutable
class AddCancelButtons extends StatelessWidget{
  TextEditingController date;
  TextEditingController set;
  TextEditingController team;
  TextEditingController url;

  AddCancelButtons(this.date,this.set,this.team,this.url);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CancelButton(),
        AddButton(date,set,team,url),
      ],
    );
  }
}

class CancelButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: RaisedButton(
        color: Colors.green.shade100,
        child: Text('キャンセル'),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

// ignore: must_be_immutable
class AddButton extends StatelessWidget{
  TextEditingController date;
  TextEditingController set;
  TextEditingController team;
  TextEditingController url;

  AddButton(this.date,this.set,this.team,this.url);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: RaisedButton(
        color: Colors.green.shade100,
        child: Text('追加'),
        onPressed: () {
          final Video video = new Video();
          video.date = DateTime.parse(date.text + ' 00:00:00');
          video.set = int.parse(set.text);
          video.team = team.text;
          video.url = url.text;

          if(VideoDataStore.existBlank(video)){
            ExistBlankDialog(context);
          }else{
            VideoDataStore.addVideo(video);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('done!'),
              duration: Duration(seconds: 2),
            ));
          }
        },
      ),
    );
  }
}