import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/models/brews.dart';
import 'package:provider/provider.dart';

import 'brew_tile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {

  @override
  Widget build(BuildContext context) {
    final brews =  Provider.of<List<Brews>>(context) ?? [];

   // print(brews.docs);
   /* brews.forEach((element) {
      print(element.name);
      print(element.strength);
      print(element.sugars);
    });*/
    return ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context,index){
          return BrewTile(brews: brews[index]);
        })
    ;
  }
}

