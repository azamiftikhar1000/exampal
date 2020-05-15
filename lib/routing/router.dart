import 'package:flutter/material.dart';
import 'package:exampal/screens/home/home.dart';
import 'package:exampal/routing/routing_constants.dart';
import 'package:exampal/screens/authenticate/sign_in.dart';
import 'package:exampal/screens/authenticate/sign_up.dart';
import 'package:exampal/routing/undefined_view.dart';
import 'package:exampal/screens/wrapper.dart';

import 'package:flutter/material.dart';

import 'package:exampal/models/user.dart'; 

Route<dynamic> generateRoute(RouteSettings settings) {
    
     
  switch (settings.name) {
    case WrapperRoute:
      return MaterialPageRoute(builder: (context) => Wrapper());
    case SigninRoute:
      return MaterialPageRoute(builder: (context) => SignInPage());
      case SignupRoute:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    default:
   
    return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name,));
  }
}