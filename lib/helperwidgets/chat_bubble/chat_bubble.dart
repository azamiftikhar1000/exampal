import 'package:exampal/models/chat_message.dart';
import 'package:exampal/screens/home/chats/chatting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../chat_bubble/chat_bubble.dart';

class ChatBubble extends StatefulWidget {
  // const ChatBubble({Key key}) : super(key: key);

  ChatMessage chatMessage;
  ChatBubble({@required this.chatMessage});

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Align(
          alignment: (widget.chatMessage.type == MessageType.Receiver? Alignment.topLeft : Alignment.topRight),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: (widget.chatMessage.type == MessageType.Receiver ? BorderRadius.only(topRight: Radius.circular(30.0), bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0)) : BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0))),
              color: (widget.chatMessage.type  == MessageType.Receiver? Colors.blue : Colors.grey.shade200),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.chatMessage.message, style: (widget.chatMessage.type == MessageType.Receiver ? TextStyle(color: Colors.white): TextStyle(color: Colors.black))),
            ),
          ),
        ),
      ),
    );
  }
}