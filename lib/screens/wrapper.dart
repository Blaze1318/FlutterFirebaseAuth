import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/models/users.dart';
import 'package:flutter_firebase_auth/screens/authenticate/authenticate.dart';
import 'package:flutter_firebase_auth/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //accessing user data from provider on the main dart file
    final user = Provider.of<Users>(context);
    print(user);

    //return either home or authenticate widget
    if(user == null)
      {
        return Authenticate(); //if user is not signed in
      }
    else{
      return Home();
    }

  }
}
