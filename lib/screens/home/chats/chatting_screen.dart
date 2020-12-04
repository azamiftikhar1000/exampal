import 'package:exampal/app_theme.dart';
import 'package:exampal/helperwidgets/chat_bubble/chat_bubble.dart';
import 'package:exampal/models/chat_message.dart';
import 'package:exampal/screens/home/chats/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum MessageType{
  Sender,
  Receiver
}

List<ChatMessage> chatMessage = [
  ChatMessage(message: "HI", type: MessageType.Sender),
  ChatMessage(message: "Hello", type: MessageType.Receiver),
  ChatMessage(message: "How are you ?", type: MessageType.Sender),
  ChatMessage(message: "I am good How are You?", type: MessageType.Receiver),
  ChatMessage(message: "I am good, so what are you upto these days?", type: MessageType.Sender),
  ChatMessage(message: "Have been trying to gain superpowers", type: MessageType.Receiver),
  ChatMessage(message: "Oh cool I already am one", type: MessageType.Sender),
  ChatMessage(message: "Who?", type: MessageType.Receiver),
  ChatMessage(message: "Goku", type: MessageType.Sender),
  ChatMessage(message: "Wow!!!", type: MessageType.Receiver),
  ChatMessage(message: "Lorem ipsum dolor sit amet, consetetur.Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, consetetur.Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, consetetur.Lorem.", type: MessageType.Sender),
];

class ChattingScreen extends StatefulWidget {
  ChattingScreen({Key key}) : super(key: key);

  @override
  _ChattingScreenState createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {

  ScrollController _scrollController = ScrollController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FintnessAppTheme.background,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/twitterlogo.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
              child: Text(
                "Name",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            )
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<int>(
              icon: Icon(
                Icons.more_vert,
                color: Colors.blue,
              ),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(value: 1, child: Text("Do Something 1")),
                  PopupMenuItem(value: 2, child: Text("Do Something 2")),
                  PopupMenuItem(value: 3, child: Text("Do Something 3")),
                ];
              })
          // GestureDetector(
          //   onTap: (){},
          //   child: Icon(
          //     Icons.more_vert,
          //     color: Colors.blue,
          //   ),
          // )
        ],
      ),
      body: Container(
          child: Stack(
        children: <Widget>[
          // Messages(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.80,
            child: ListView.builder(
              controller: _scrollController,
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: chatMessage.length,
              itemBuilder: (context, index){
                return ChatBubble(chatMessage: chatMessage[index]);
              }
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
                      child: TextField(
                        enableInteractiveSelection: true,
                        // obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Type here...",
                            // suffixIcon: Icon(Icons.face, color: Colors.blue,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(),
                        child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.blue,
                            )),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(),
                        child: GestureDetector(
                          onTap: (){
                            print("SendButton");    
                            // SchedulerBinding.instance.addPostFrameCallback((_) { 
                              _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
                            // }); 
                          },
                                                  child: Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
