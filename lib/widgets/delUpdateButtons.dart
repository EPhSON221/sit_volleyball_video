import 'package:flutter/material.dart';
import '../entity/video.dart';
import '../entity/videoDataStore.dart';
import '../dialogs/existBlankDialog.dart';

class DelUpdateButtons extends StatelessWidget {
  final String path;
  final List<TextEditingController> list;

  DelUpdateButtons(this.path, this.list);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DellButton(path),
        UpdateButton(path, list),
      ],
    );
  }
}

class DellButton extends StatelessWidget {
  final String path;

  DellButton(this.path);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: RaisedButton(
        child: Text('削除する'),
        color: Colors.green.shade100,
        onPressed: () {
          VideoDataStore.delVideo(path);
          Navigator.pop(context);
        },
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  final List<TextEditingController> list;
  final String path;

  UpdateButton(this.path, this.list);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: RaisedButton(
        child: Text('更新'),
        color: Colors.green.shade100,
        onPressed: () {
          final video = Video.readController(list);
          if (VideoDataStore.existBlank(video)) {
            ExistBlankDialog(context);
          } else {
            VideoDataStore.updateVideo(path, video);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
