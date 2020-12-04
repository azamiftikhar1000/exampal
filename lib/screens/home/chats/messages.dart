import 'package:exampal/screens/home/chat/chat.dart';
import 'package:exampal/screens/home/chats/chatting_screen.dart';
import 'package:exampal/screens/home/friendsList/friendsList_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_theme.dart';
import '../../../utils/exampal_icons.dart';


class Messages extends StatefulWidget {
  Messages({Key key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> with TickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _animation;
  
  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(vsync: this, value: 0.0, duration: Duration(seconds: 1));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.reverse();
      }
    });
    // _controller.reverse();
  }

  @override
  void dispose() { 
    
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: FintnessAppTheme.background,
        // backgroundColor: Colors.transparent,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){
        //     Navigator.push(context, CupertinoPageRoute(builder: (context)=> FriendsList()));
        //   },
        //   elevation: 90.0,
        //   // splashColor: Colors.purple,
        //   child: Icon(Icons.add_comment),
        // ),
        body: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: GestureDetector(
                          onTap: (){
                            print("Hey you tapped a MESSAGE!!");
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) => ChattingScreen())
                            );
                          },
                          child: Card(
                            color: FintnessAppTheme.background,
                            elevation: 0.3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                              child: ListTile(
                                leading: Stack(
                                  children: <Widget>[
                                    CircleAvatar(
                                      onBackgroundImageError: null,
                                      maxRadius: 30,
                                      backgroundImage:
                                        AssetImage("assets/images/twitterlogo.jpg"),
                                    ),
                                    ScaleTransition(
                                      alignment: Alignment.topRight,
                                      scale: _animation,
                                      child: Container(
                                        height: 8,
                                        width: 8,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          // color: Colors.blue
                                          color: FintnessAppTheme.nearlyDarkBlue
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 0,
                                      left: 50,
                                      child: ScaleTransition(
                                        alignment: Alignment.bottomLeft,
                                        scale: _animation,
                                        child: Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            // color: Colors.blue
                                            color: FintnessAppTheme.nearlyDarkBlue
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 40,
                                      right: 0,
                                      left: 20,
                                      child: ScaleTransition(
                                        alignment: Alignment.bottomLeft,
                                        scale: _animation,
                                        child: Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            // color: Colors.blue
                                            color: FintnessAppTheme.nearlyDarkBlue
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("USERNAME",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                trailing: Text("25/12/5078",style: TextStyle(fontSize: 10.0),),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
        ),
      ),
    );
  }
}

