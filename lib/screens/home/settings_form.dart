import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/shared/constants.dart';

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
              decoration: inputTextField,
              validator: (val) => val.isEmpty? 'Please Enter Name' : null,
              onChanged: (val) => setState(() => _currentName = val),
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField(
              decoration: inputTextField,
              value: _currentSugars ?? '0',
                items: sugars.map((sugar)  {
                  return DropdownMenuItem(
                    value: sugar,
                      child: Text('$sugar sugars'),
                  );
                }).toList(),
                onChanged: (val) => setState(() => _currentSugars = val),
            ),
            Slider(
              activeColor: Colors.brown[_currentStrength ?? 100],
              inactiveColor: Colors.brown[_currentStrength ?? 100],
              min: 100,
              max: 900,
              divisions: 8,
              onChanged: (val) => setState(() => _currentStrength = val.round()),
              value: (_currentStrength ?? 100).toDouble(),
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

                }
            ),
          ],
        ),
      );
  }
}

