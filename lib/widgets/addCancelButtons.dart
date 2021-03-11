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
        onPressed: () => _onButtonPressed(context),
      ),
    );
  }

  void _onButtonPressed(BuildContext context){
    final Video video = new Video.readController(controllerList);

    if(VideoDataStore.existBlank(video)){
      ExistBlankDialog(context);
    }else{
      VideoDataStore.addVideo(video);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('done!'),
        duration: Duration(seconds: 2),
      ));
    }
  }
}