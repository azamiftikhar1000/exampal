import 'package:exampal/screens/home/chat/chat.dart';
import 'package:flutter/material.dart';

import 'const.dart';
import 'login.dart';
import 'home.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData(
        primaryColor: themeColor,
      ),
      home: LoginScreen(title: 'CHAT DEMO'),
      // home: Chat(peerAvatar: null, peerId: null,),
      debugShowCheckedModeBanner: false,
    );
  }
}
