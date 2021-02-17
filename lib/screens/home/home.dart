
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/models/brews.dart';
import 'package:flutter_firebase_auth/services/auth.dart';
import 'package:flutter_firebase_auth/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_auth/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel()
    {
      showModalBottomSheet(context: context, builder:(context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
          child: Text('Bottom Sheet'),
        );
      });
    }
    return StreamProvider< List<Brews>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('BrewCrew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(onPressed: () async{
              await _auth.signOut();
            }, icon: Icon(Icons.person),
                label: Text('Logout')),
            FlatButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text('Settings')
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
