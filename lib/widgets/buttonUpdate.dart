import 'package:flutter/material.dart';
import '../entity/video.dart';
import '../entity/videoDataStore.dart';
import '../dialogs/existBlankDialog.dart';

class ButtonUpdate extends StatelessWidget {
  final List<TextEditingController> list;
  final String path;

  ButtonUpdate(this.path, this.list);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('更新'),
        color: Colors.green.shade100,
        onPressed: () => _onButtonPressed(context),
    );
  }

  void _onButtonPressed(BuildContext context){
    final video = Video.readController(list);

    if (VideoDataStore.existBlank(video)) {
      ExistBlankDialog(context);
    } else {
      VideoDataStore.updateVideo(path, video);
      Navigator.of(context).pop();
    }
  }
}
