import 'package:flutter/material.dart';
import 'package:sit_volleyball_video/dialogs/normalAlertDialog.dart';
import 'package:sit_volleyball_video/entity/teamOperation.dart';
import '../entity/video.dart';
import '../entity/team.dart';
import '../entity/videoOperation.dart';
import '../dialogs/existBlankDialog.dart';

// ignore: must_be_immutable
class ButtonAdd extends StatelessWidget{
  String type;
  final controllerList;

  ButtonAdd.video(this.controllerList): type = 'video';
  ButtonAdd.team(this.controllerList): type = 'team';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: RaisedButton(
        color: Colors.green.shade100,
        child: Text('追加'),
        onPressed: () {
          if(type == 'video') _video(context);
          else if(type == 'team') _team(context);
        },
      ),
    );
  }

  void _video(BuildContext context){
    final Video video = new Video.readController(controllerList);

    if(video.existBlank()){
      ExistBlankDialog(context);
    }else{
      VideoOperation.addVideo(video);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('done!'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  void _team(BuildContext context) {
    final Team team = Team.readController(controllerList);

    if (controllerList[0].text == ''){
      NormalAlertDialog('チーム名を入力して下さい', context);
    }else{
      TeamOperation.addTeam(team);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('done!'),
        duration: Duration(seconds: 2),
      ));
      Navigator.pop(context);
    }
  }
}