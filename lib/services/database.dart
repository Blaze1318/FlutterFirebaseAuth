import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_auth/models/brews.dart';
import 'package:flutter_firebase_auth/models/users.dart';

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

  //user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot)
  {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      sugars: snapshot.data()['sugars'],
      strength: snapshot.data()['strength'],
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

  //get user data
 Stream<UserData> get userData{
    return brewCollection.doc(uid).snapshots()
    .map(_userDataFromSnapshot);
 }
}