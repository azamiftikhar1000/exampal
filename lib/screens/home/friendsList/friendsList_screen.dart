// import 'package:exampal/screens/home/chats/chatting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsList extends StatefulWidget {
  FriendsList({Key key}) : super(key: key);

  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Container(
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.blue[200]),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0,25.0,0.0,0.0),
                      child: Text(
                        "Friends List",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            child: Card(
                              elevation: 0.3,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: ListTile(
                                    leading: CircleAvatar(
                                      maxRadius: 30,
                                      backgroundImage: AssetImage(
                                          "assets/images/twitterlogo.jpg"),
                                    ),
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("USERNAME",
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    trailing: GestureDetector(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.blue,
                                        ))),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
