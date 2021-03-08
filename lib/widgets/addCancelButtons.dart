import 'package:flutter/material.dart';
import '../entity/video.dart';
import '../entity/videoDataStore.dart';
import '../dialogs/existBlankDialog.dart';

// ignore: must_be_immutable
class AddCancelButtons extends StatelessWidget{
  final controllerList;

  AddCancelButtons(this.controllerList);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CancelButton(),
        AddButton(controllerList),
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
  final controllerList;

  AddButton(this.controllerList);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: RaisedButton(
        color: Colors.green.shade100,
        child: Text('追加'),
        onPressed: () {
          final Video video = new Video();
          video.date = DateTime.parse(controllerList[0].text + ' 00:00:00');
          video.set = int.parse(controllerList[1].text);
          video.team = controllerList[2].text;
          video.url = controllerList[3].text;

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