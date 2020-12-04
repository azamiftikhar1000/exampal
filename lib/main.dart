import 'package:exampal/screens/focus/focusScreen.dart';
import 'package:exampal/screens/home/home_screen.dart';
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
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
        initialRoute: WrapperRoute,
        home: Home(),
        // home: FoccusScreen(),
      ),
    );
  }
}

// import 'dart:js';

// import 'package:exampal/models/mymodel.dart';
// import 'package:exampal/screens/home/home_screen.dart';
// import 'package:exampal/screens/home/my_diary/my_diary_screen.dart';
// import 'package:exampal/screens/wrapper.dart';
// import 'package:exampal/services/auth.dart';
// import 'package:flutter/material.dart';
// import 'package:exampal/models/user.dart';
// import 'package:provider/provider.dart';
// import 'package:exampal/routing/router.dart' as router;
// import 'package:exampal/routing/routing_constants.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         StreamProvider<User>.value(
//           value: AuthService().user,
//         ),
//         ChangeNotifierProvider<MyModel>(create: (context)=> MyModel())
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         onGenerateRoute: router.generateRoute,
//         // initialRoute: WrapperRoute,
//         home: Home(),
//       ),
//     );
//   }
// }
