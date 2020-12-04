import 'package:exampal/screens/home/chats/chatting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_theme.dart';

class Groups extends StatefulWidget {
  Groups({Key key}) : super(key: key);

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FintnessAppTheme.background,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   child: Icon(Icons.group_add),
      // ),
      body: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: GestureDetector(
                        onTap: (){
                          print("Hey you tapped a GROUP!!");
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => ChattingScreen()),
                          );
                        },
                        child: Card(
                          color: FintnessAppTheme.background,
                          elevation: 1.0,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                maxRadius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/twitterlogo.jpg"),
                              ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("GROUP NAME",
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
                  }),
    );
  }
}