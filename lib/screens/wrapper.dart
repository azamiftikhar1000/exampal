import 'package:exampal/screens/home/home_screen.dart';
import 'package:exampal/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exampal/models/user.dart'; 

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    
    print(user);
    
   // return either the Home or Authenticate widget
    if (user == null){
      
      return Authenticate();
    } else {
      print("user is not null");
      return Home();
    }

  }
}