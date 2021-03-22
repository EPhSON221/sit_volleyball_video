import 'package:flutter/material.dart';
import 'package:sit_volleyball_video/widgets/buttonAdd.dart';
import '../widgets/normalTextField.dart';

class PageAddTeam extends StatelessWidget{
  final TextEditingController name = new TextEditingController();
  final TextEditingController twitter = new TextEditingController();
  final TextEditingController instagram = new TextEditingController();
  final TextEditingController hp = new TextEditingController();
  final List<TextEditingController> controllerList = [];

  PageAddTeam(){
    controllerList.add(name);
    controllerList.add(twitter);
    controllerList.add(instagram);
    controllerList.add(hp);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        centerTitle: true,
        title: Text('チーム追加'),
      ),
      body: _buildBody(),
    );
  }
  
  Widget _buildBody(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          NormalTextField('name','芝浦工大',name),
          SizedBox(height: 20.0),
          NormalTextField('twitter', 'https://twitter.com/shibaura_volley', twitter),
          SizedBox(height: 20.0),
          NormalTextField('instagram', 'https://instagram.com/ryusuke_bb', instagram),
          SizedBox(height: 20.0),
          NormalTextField('HP', 'https://shibaball.exblog.jp', hp),
          SizedBox(height: 20.0),
          ButtonAdd.team(controllerList),
        ],
      ),
    );
  }
}