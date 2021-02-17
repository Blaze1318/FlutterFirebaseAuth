import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_auth/models/brews.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  //creating/using collection brews
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');



  Future updateUserData(String sugars, String name,int strength) async
  {
    return await brewCollection.doc(uid).set(
      {
        'sugars':sugars,
        'name':name,
        'strength':strength
      }
    );
  }

  List<Brews> _brewListFromSnapshop(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc) {
      return Brews(
        name: doc.data()['name'] ?? '',
        strength: doc.data()['strength'] ?? 0,
        sugars: doc.data()['sugars'] ?? ''
      );
    }).toList();
  }

  //get brews stream
  Stream<List<Brews>> get brews{
    return brewCollection.snapshots()
    .map(_brewListFromSnapshop);
  }
}