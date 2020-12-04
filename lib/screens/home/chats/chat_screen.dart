import 'package:exampal/screens/home/chats/groups.dart';
import 'package:exampal/screens/home/chats/messages.dart';
import 'package:exampal/screens/home/friendsList/friendsList_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../helperwidgets/tabindicator/circleTabIndicator.dart';
import '../../../app_theme.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width;
    var width = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  //   child: Text(
                  //     "CHATS",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 25.0,
                  //     ),
                  //   ),
                  // ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.pink,
                        child: Center(
                          child: Text(
                            "CHATS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 3.0),
                          child: Container(
                            // color: Colors.blue,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, CupertinoPageRoute(builder: (context)=> FriendsList()));
                              },
                                child: Icon(Icons.add_circle,
                                    color: FintnessAppTheme.nearlyDarkBlue)),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Icon(Icons.add_comment,color: FintnessAppTheme.nearlyDarkBlue ))
                ],
              ),
              Container(
                  width: width,
                  height: height * 0.12,
                  child: TabBar(
                      controller: _tabcontroller,
                      indicator:
                          CircleTabIndicator(color: Colors.blue, radius: 4),
                      tabs: [
                        Tab(
                          child: Text(
                            "Messages",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text("Group",
                              style: TextStyle(color: Colors.black)),
                        )
                      ])),
              Expanded(
                  child: TabBarView(
                      controller: _tabcontroller,
                      children: <Widget>[Messages(), Groups()]))
            ],
          ),
        ),
      ),
    );
  }
}
