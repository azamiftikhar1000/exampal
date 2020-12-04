import 'package:exampal/screens/home/chats/chatting_screen.dart';
import 'package:flutter/cupertino.dart';

class ChatMessage{
  String message;
  MessageType type;

  ChatMessage({@required this.message, @required this.type});
}