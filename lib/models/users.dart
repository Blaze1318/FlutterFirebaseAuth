class Users
{
  //TODO: class for user data from firebase auth response
  final String uid;

  Users({this.uid});
}

class UserData
{
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({this.uid,this.name,this.sugars,this.strength});
}