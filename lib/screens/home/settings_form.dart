import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/models/users.dart';
import 'package:flutter_firebase_auth/services/database.dart';
import 'package:flutter_firebase_auth/shared/constants.dart';
import 'package:flutter_firebase_auth/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid:user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData)
          {
            UserData data = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your brew settings',
                    style: TextStyle(
                        fontSize: 18.0
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: data.name,
                    decoration: inputTextField,
                    validator: (val) => val.isEmpty? 'Please Enter Name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 20.0),
                  DropdownButtonFormField(
                    decoration: inputTextField,
                    value: _currentSugars ?? data.sugars,
                    items: sugars.map((sugar)  {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugars'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentSugars = val),
                  ),
                  Slider(
                    activeColor: Colors.brown[_currentStrength ?? data.strength],
                    inactiveColor: Colors.brown[_currentStrength ?? data.strength],
                    min: 100,
                    max: 900,
                    divisions: 8,
                    onChanged: (val) => setState(() => _currentStrength = val.round()),
                    value: (_currentStrength ?? data.strength).toDouble(),
                  ),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async{
                          if(_formKey.currentState.validate())
                            {
                              await DatabaseService(uid: user.uid).updateUserData(
                                  _currentSugars ?? data.sugars,
                                  _currentName ?? data.name,
                                  _currentStrength ?? data.strength,
                              );
                              Navigator.pop(context);
                            }
                      }
                  ),
                ],
              ),
            );
          }else{
            return Loading();
        }
      }
    );
  }
}

