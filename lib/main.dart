import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/screens/authenticate/register.dart';
import 'package:flutter_firebase_auth/screens/authenticate/signin.dart';
import 'package:flutter_firebase_auth/screens/wrapper.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Wrapper(),
      routes: {
          '/register': (context) => Register(),
          '/signin': (context) => SignIn(),
      },
    );
  }
}
