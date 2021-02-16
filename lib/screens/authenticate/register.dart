import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/services/auth.dart';
import 'package:flutter_firebase_auth/shared/constants.dart';
import 'package:flutter_firebase_auth/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggle;
  Register({this.toggle});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _service = AuthService();
  final _formKey = GlobalKey<FormState>(); // this is used to identify a form
  bool loading = false;

  //text field states
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Register to BrewCrew"),
        actions: <Widget> [
          FlatButton.icon(
            icon:Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: ()
              {
                widget.toggle();
             }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty? 'Enter Email' : null,
                onChanged: (val){
                  setState(() =>  email = val);
                },
                decoration: inputTextField.copyWith(hintText: 'Email'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (val) => val.length < 6? 'Enter a password 6+ Chars long' : null,
                onChanged: (val){
                  setState(() => password = val);
                },
                decoration: inputTextField.copyWith(hintText:'Password'),
              ),
              SizedBox(height:20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async{
                 if(_formKey.currentState.validate())
                   {
                     setState(() => loading = true);
                        dynamic result = await _service.registerWithEmailAndPassword(email, password);
                        if(result == null)
                          {
                             setState(() {
                               error = 'Enter A Valid Email';
                               loading = false;
                             });
                          }
                   }
                },
              ),
              SizedBox(height:12.0),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
