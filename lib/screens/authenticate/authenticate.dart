import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/screens/authenticate/register.dart';
import 'package:flutter_firebase_auth/screens/authenticate/signin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool toggleView = true;
  void toggleScreen()
  {
    setState(() => toggleView = !toggleView);
  }
  @override
  Widget build(BuildContext context) {
    if(toggleView){
      return SignIn(toggle: toggleScreen);
    }else{
      return Register(toggle: toggleScreen);
    }
  }
}
