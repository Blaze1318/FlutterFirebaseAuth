import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/models/brews.dart';

class BrewTile extends StatelessWidget {

  final Brews brews;
  BrewTile({this.brews});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:2.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brews.strength],
          ),
          title: Text(brews.name),
          subtitle: Text('Takes ${brews.sugars} sugars'),
        ),
      ),
    );
  }
}
