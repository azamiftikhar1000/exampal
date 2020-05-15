import 'package:exampal/screens/wrapper.dart';
import 'package:exampal/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:exampal/models/user.dart';
import 'package:provider/provider.dart';
import 'package:exampal/routing/router.dart' as router;
import 'package:exampal/routing/routing_constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
 
        onGenerateRoute: router.generateRoute,
        initialRoute: WrapperRoute,
      ),
    );
  }
}