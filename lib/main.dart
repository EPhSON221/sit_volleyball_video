import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/pageHome.dart';
import 'pages/pageVideoList.dart';
import 'pages/pageTeamList.dart';
import 'pages/pageAddVideo.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: '/Home',
      routes: {
        '/Home': (context) => PageHome(),
        '/VideoList': (context) => PageVideoList(),
        '/TeamList': (context) => PageTeamList(),
        '/AddVideo': (context) => PageAddVideo(),
      },
    ),
  );
}
