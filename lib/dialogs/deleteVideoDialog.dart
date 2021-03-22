import 'package:flutter/material.dart';
import 'package:sit_volleyball_video/entity/videoOperation.dart';

class DeleteVideoDialog {
  final String path;
  final BuildContext context;

  DeleteVideoDialog(this.path, this.context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('本当に消しますか?'),
            actions: [delButton()],
          );
        });
  }

  Widget delButton() {
    return TextButton(
      child: Text('ok'),
      onPressed: () => _onButtonPressed(),
    );
  }

  void _onButtonPressed() {
    VideoOperation.delVideo(path);
    Navigator.popUntil(context, ModalRoute.withName('/VideoList'));
  }
}
