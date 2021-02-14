import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/services/auth.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService service = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to BrewCrew"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50),
        child: RaisedButton(
          child: Text(
            'Sign In Anon'
          ),
          onPressed: () async{
              dynamic result = await service.signinAnon();
              if(result == null){
                print('Error signing in');
              }
              else{
                print('Signed in');
                print(result.uid);
              }
          },
        ),
      ),
    );
  }
}
