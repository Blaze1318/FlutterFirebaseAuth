import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/models/users.dart';

class AuthService
{

  final FirebaseAuth _auth = FirebaseAuth.instance;

 //TODO: Storing user data from Firebase into Users model
 Users _userFromFirebase(User user)
 {
  return user != null ? Users(uid: user.uid) : null;
 }

  //TODO: sign in with email and pass
  Future signinWithEmailAndPassword() async
  {
    try{

    }catch(e)
    {

    }
  }


  //TODO:Sign in anonmonously
  Future signinAnon() async{
    try{
      //the UserCredential object and variable is used to get an authentication result
     UserCredential result = await _auth.signInAnonymously();

     //getting current user
      User user = result.user;

      return _userFromFirebase(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
  //TODO: register with email and password
  Future registerWithEmailAndPassword() async
  {
    try{

    }catch(e)
    {

    }
  }

  //TODO sign out
  Future signOut() async
  {
    try{

    }
    catch(e)
    {

    }
  }
}